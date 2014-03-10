class CreateSqueezes < ActiveRecord::Migration
  def up
    if Rails.env.production? || Rails.env.staging?
      execute "CREATE FOREIGN TABLE squeezes(id integer NOT NULL, email character varying(255) DEFAULT ''::character varying NOT NULL) SERVER salveainternet OPTIONS (table_name 'squeezes');"
    else
      create_table :squeezes do |t|
        t.string :email
      end
    end
  end

  def down
    if Rails.env.production? || Rails.env.staging?
      execute "DROP FOREIGN TABLE squeezes;"
    else
      drop_table :squeezes
    end
  end
end