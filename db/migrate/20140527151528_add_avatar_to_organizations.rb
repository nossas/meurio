class AddAvatarToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :avatar, :string
  end
end
