class CreateCompartilhacoFacebookProfileSpreaders < ActiveRecord::Migration
  def up
    if Rails.env.production? || Rails.env.staging?
      execute <<-SQL
        CREATE FOREIGN TABLE compartilhaco_facebook_profile_spreaders(id integer)
        SERVER compartilhaco
        OPTIONS (table_name 'facebook_profile_spreaders');
      SQL
    else
      create_table :compartilhaco_facebook_profile_spreaders
    end
  end

  def down
    if Rails.env.production? || Rails.env.staging?
      execute "DROP FOREIGN TABLE compartilhaco_facebook_profile_spreaders;"
    else
      execute "DROP TABLE compartilhaco_facebook_profile_spreaders;"
    end
  end
end
