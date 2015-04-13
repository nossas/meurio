class CreateMultitudeRewards < ActiveRecord::Migration
  def up
    if Rails.env.production? || Rails.env.staging?
      execute <<-SQL
        CREATE FOREIGN TABLE multitude_rewards(id integer)
        SERVER multitude
        OPTIONS (table_name 'multitude_rewards');
      SQL
    else
      create_table :multitude_rewards
    end
  end

  def down
    if Rails.env.production? || Rails.env.staging?
      execute <<-SQL
        DROP FOREIGN TABLE multitude_rewards;
      SQL
    else
      drop_table :multitude_rewards
    end
  end
end
