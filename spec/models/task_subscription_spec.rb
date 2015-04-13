require 'spec_helper'

describe TaskSubscription do
  describe "#late?" do
    let(:task) { Task.make! }
    let(:expired_task) { Task.make! deadline: 1.day.ago }

    context "when the task is not expired" do
      subject { TaskSubscription.make! task: task }
      it "should be false" do
        expect(subject.late?).to be false
      end
    end

    context "when the task is expired" do
      subject { TaskSubscription.make! task: expired_task }

      context "when the user have no delivery" do
        it "should be true" do
          expect(subject.late?).to be true
        end
      end

      context "when the user have a delivery" do
        context "when the delivery is accepted" do
          before { Delivery.make! task: subject.task, user: subject.user, accepted_at: Time.now }
          it "should be false" do
            expect(subject.late?).to be false
          end
        end

        context "when the delivery is not accepted" do
          before { Delivery.make! task: subject.task, user: subject.user }
          it "should be true" do
            expect(subject.late?).to be true
          end
        end
      end

      context "when the user have a reward" do
        before { MultitudeReward.make! task: subject.task, user: subject.user }

        it "should be false" do
          expect(subject.late?).to be false
        end
      end
    end
  end
end
