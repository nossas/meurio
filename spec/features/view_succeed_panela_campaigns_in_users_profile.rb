require 'spec_helper'

feature "View succeed Panela campaigns in user's profile" do
  let(:user) { User.make! }

  context "when there is a succeed Panela campaign" do
    let(:panela_campaign) { PanelaCampaign.make! succeed: true }

    context "when the user poked this Panela campaign" do
      before { PanelaPoke.make! user: user, panela_campaign: panela_campaign }

      it "should show the succeed Panela campaign" do
        visit user_path(id: user.id)
        expect(page).to have_css(".panela-campaign .name", text: panela_campaign.name)
      end
    end

    context "when the user haven't poked this Panela campaign" do
      it "should not show the succeed Panela campaigns container" do
        visit user_path(id: user.id)
        expect(page).to_not have_css(".succeed-panela-campaigns")
      end
    end
  end
end
