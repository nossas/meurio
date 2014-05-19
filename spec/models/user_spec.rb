require 'spec_helper'

describe User do
  it { should have_many(:badges).through :achievements }
  it { should have_many :activities }
  it { should have_many :task_subscriptions }
  it { should have_many :rewards }

  describe "#task_type_score" do
    let(:user) { User.make! }
    let(:task_type) { TaskType.make! }
    let(:second_task_type) { TaskType.make! }

    context "when there are no rewards" do
      it "is zero" do
        expect(user.task_type_score task_type.id).to eq(0)
      end
    end

    context "when there are many rewards" do
      points = [ 500, 700, 1400, 250, 60, 15, 15 ]
      before { points.each { |p| Reward.make! user: user, task_type: task_type, points: p } }

      it "sums all reward points of a task type" do
        expect(user.task_type_score task_type.id).to eq(points.sum)
      end

      it "sums only the current task type's points" do
        Reward.make! user: user, task_type: second_task_type, points: 50
        expect(user.task_type_score second_task_type.id).to eq(50)
      end
    end
  end

  describe "#category_score" do
    let(:user) { User.make! }
    let(:category) { Category.make! }
    let(:task_type) { TaskType.make! category: category }
    let(:second_category) { Category.make! }
    let(:second_task_type) { TaskType.make! category: second_category }

    context "when there are no rewards" do
      it "is zero" do
        expect(user.category_score category.id).to eq(0)
      end
    end

    context "when there are many rewards" do
      points = [ 500, 700, 1400, 250, 60, 15, 15 ]
      before { points.each { |p| Reward.make! user: user, task_type: task_type, points: p } }

      it "sums all reward points of a category" do
        expect(user.category_score category.id).to eq(points.sum)
      end

      it "sums only the current category's points" do
        Reward.make! user: user, task_type: second_task_type, points: 50
        expect(user.category_score second_category.id).to eq(50)
      end
    end
  end

  describe "#earn_badge" do
    let(:user) { User.make! }
    let(:badge) { Badge.make! points: 500 }

    context "when the user already have this badge" do
      before { user.badges << badge }

      it "doesn't earn a duplicated badge" do
        expect { user.earn_badge badge }.to change { user.badges.count }.by(0)
      end
    end

    context "when the user doesn't have this badge" do
      it "earns a badge" do
        expect { user.earn_badge badge }.to change { user.badges.count }.by(1)
      end
    end
  end

  describe "#last_badge" do
    let(:user) { User.make! }
    let(:first_badge) { Badge.make! points: 500 }
    let(:second_badge) { Badge.make! points: 500 }

    context "when the user have badges" do
      before { user.earn_badge first_badge }
      before { user.earn_badge second_badge }

      it "gets the last badge" do
        expect(user.last_badge).to eq(second_badge)
      end
    end

    context "when the user doesn't have a badge" do
      it "gets nil" do
        expect(user.last_badge).to be_nil
      end
    end
  end

  describe "#last_badges" do
    let(:user) { User.make! }
    let(:first_badge) { Badge.make! points: 1000 }
    let(:last_badge) { Badge.make! points: 1000 }

    context "when the user have badges" do
      before { user.earn_badge first_badge }
      before { 15.times { user.earn_badge(Badge.make! points: 500) } }
      before { user.earn_badge last_badge }

      it "gets all badges" do
        expect(user.last_badges.count).to eq(17)
      end

      it "gets first the last badge" do
        expect(user.last_badges.first).to eq(last_badge)
      end

      it "gets last the first badge" do
        expect(user.last_badges.last).to eq(first_badge)
      end
    end

    context "when the user doesn't have badges" do
      it "gets nil" do
        expect(user.last_badges).to be_nil
      end
    end
  end

  describe ".funders" do
    subject { User }

    context "when there is no successful transaction" do
      its(:funders){ should be_empty }
    end

    context "when there is at least one successful transaction" do
      before { SuccessfulTransaction.make! }
      its(:funders){ should_not be_empty }
    end

    context "when there is two successful transactions for the same user" do
      let(:user){ User.make! }
      before { SuccessfulTransaction.make! user: user }
      before { SuccessfulTransaction.make! user: user }
      its(:funders){ should have(1).user }
    end
  end
end
