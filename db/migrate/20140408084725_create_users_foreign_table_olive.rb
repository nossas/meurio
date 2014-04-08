class CreateUsersForeignTableOlive < ActiveRecord::Migration
  def up
    if Rails.env.production? || Rails.env.staging?
      execute(
      %Q{
        CREATE FOREIGN TABLE users(
          id integer NOT NULL,
          email character varying(255) DEFAULT ''::character varying NOT NULL,
          first_name character varying(255) NOT NULL,
          last_name character varying(255) NOT NULL,
          avatar character varying(255),
          skills character varying(255)[] DEFAULT '{}'::character varying[],
          created_at timestamp without time zone,
          updated_at timestamp without time zone,
          profession character varying(255),
          facebook character varying(255),
          twitter character varying(255),
          city character varying(255),
          state character varying(255),
          bio text,
          admin boolean,
          funder boolean DEFAULT false,
          address_district character varying(255),
          website character varying(255),
          sponsor boolean DEFAULT false
        )
        SERVER meurio_accounts
        OPTIONS (table_name 'users');
      }
      )
    end
  end

  def down
    if Rails.env.production? || Rails.env.staging?
      execute 'DROP FOREIGN TABLE users;'
    end
  end
end
