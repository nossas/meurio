class AddFacebookPageUidToOrganization < ActiveRecord::Migration
  def change
    add_column :organizations, :facebook_page_uid, :string
  end
end
