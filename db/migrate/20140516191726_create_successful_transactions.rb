class CreateSuccessfulTransactions < ActiveRecord::Migration
  def up
    if Rails.env.production? || Rails.env.staging?
      execute <<-SQL
        CREATE FOREIGN TABLE successful_transactions(id integer, user_id integer)
        SERVER facaacontecer
        OPTIONS (table_name 'successful_transactions');
      SQL
    else
      create_table :successful_transactions do |t|
        t.integer :user_id
        t.timestamps
      end
    end
  end

  def down
    if Rails.env.production? || Rails.env.staging?
      execute <<-SQL
        DROP FOREIGN TABLE successful_transactions;
      SQL
    else
      drop_table :successful_transactions
    end
  end
end
