require 'spec_helper'

describe User do
  it { should have_and_belong_to_many :badges }
  it { should have_many :activities }
  it { should have_many :task_subscriptions }
  it { should have_many :rewards }

  describe "#score_in_task_type" do
    let(:user) { User.make! }
    let(:task_type) { TaskType.make! }
    let(:second_task_type) { TaskType.make! }

    context "when there are no rewards" do
      it "is zero" do
        expect(user.score_in_task_type task_type.id).to eq(0)
      end
    end

    context "when there are many rewards" do
      points = [ 500, 700, 1400, 250, 60, 15, 15 ]
      before { points.each { |p| Reward.make! user: user, task_type: task_type, points: p } }

      it "sums all reward points of a task type" do
        expect(user.score_in_task_type task_type.id).to eq(points.sum)
      end

      it "sums only the current task type's points" do
        Reward.make! user: user, task_type: second_task_type, points: 50
        expect(user.score_in_task_type second_task_type.id).to eq(50)
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
end
