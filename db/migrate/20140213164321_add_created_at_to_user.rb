class AddCreatedAtToUser < ActiveRecord::Migration
  def change
    if Rails.env.production? || Rails.env.staging?
      add_column :users, :created_at, :datetime
    end
  end
end
