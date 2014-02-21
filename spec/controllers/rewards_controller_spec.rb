require 'spec_helper'

describe RewardsController do
  describe "POST create" do
    before(:all) { @user = User.make! }
    before(:all) { @task_type = TaskType.make! }
    let(:valid_params) { {format: 'json', token: ENV["API_TOKEN"], reward: { user_id: @user.id, task_type_id: @task_type.id, points: 100 }} }
    let(:invalid_params) { {format: 'json', token: ENV["API_TOKEN"], reward: { user_id: nil, task_type_id: nil, points: nil }} }
    let(:unauthorized_params) { {format: 'json', token: nil, reward: { user_id: @user.id, task_type_id: @task_type.id, points: 100 }} }

    context "when the token is valid" do
      context "when the params are correct" do
        it "should create a new reward" do
          expect {
            post :create, valid_params
          }.to change{Reward.count}.by(1)
        end

        it "should return the new reward id" do
          post :create, valid_params
          expect(JSON.parse(response.body)["id"]).to be > 0
        end
      end

      context "when the params are not correct" do
        before { post :create, invalid_params }

        it "should return 422 error status" do
          expect(response.status).to be == 422
        end

        it "should return a hash of errors" do
          expect(JSON.parse(response.body)["errors"]).to be_an_instance_of(Hash)
        end
      end
    end

    context "when the token is not valid" do
      it "should return 403 error status" do
        post :create, unauthorized_params
        expect(response.status).to be == 403
      end
    end
  end
end
