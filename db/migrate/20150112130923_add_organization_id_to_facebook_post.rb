class AddOrganizationIdToFacebookPost < ActiveRecord::Migration
  def change
    add_column :facebook_posts, :organization_id, :integer, foreign_key: false
  end
end
