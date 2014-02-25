require 'spec_helper'

describe Reward do
  before(:all) { Reward.make! }
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :task_type_id }
  it { should validate_presence_of :points }
  it { should validate_presence_of :source_app }
  it { should validate_presence_of :source_model }
  it { should validate_presence_of :source_id }
  it { should validate_uniqueness_of(:source_app).scoped_to(:source_model, :source_id) }

  describe "#grant_badges" do
    let(:user) { User.make! }
    let(:badge) { Badge.make! points: 500 }
    let(:task_type) { TaskType.make! badges: [badge] }
    
    context "when the user earns a badge" do
      before { Reward.make! user: user, task_type: task_type, points: 800 }
      
      it "grants a badge" do
        expect(user.badges).to include badge
      end
    end

    context "when the user doesn't earn a badge" do
      before { Reward.make! user: user, task_type: task_type, points: 250 }
      
      it "doesn't grant a badge" do
        expect(user.badges).not_to include badge
      end
    end
  end
end
