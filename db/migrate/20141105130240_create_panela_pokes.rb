class CreatePanelaPokes < ActiveRecord::Migration
  def up
    if Rails.env.production? || Rails.env.staging?
      execute <<-SQL
        CREATE FOREIGN TABLE panela_pokes(id integer)
        SERVER panela
        OPTIONS (table_name 'pokes');
      SQL
    else
      create_table :panela_pokes
    end
  end

  def down
    if Rails.env.production? || Rails.env.staging?
      execute "DROP FOREIGN TABLE panela_pokes;"
    else
      execute "DROP TABLE panela_pokes;"
    end
  end
end
