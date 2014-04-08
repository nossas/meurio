class ReAddIdToTask < ActiveRecord::Migration
  def up
    if Rails.env.production? || Rails.env.staging?
      execute "ALTER TABLE tasks ADD COLUMN id integer;"
    end
  end

  def down
    if Rails.env.production? || Rails.env.staging?
      execute "ALTER TABLE tasks DROP COLUMN id"
    end
  end
end
