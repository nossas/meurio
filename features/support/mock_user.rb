Before do
  ActiveRecord::Base.connection.execute("DROP TABLE IF EXISTS users;")
  ActiveRecord::Base.connection.execute("
    CREATE TABLE IF NOT EXISTS users(
      id                SERIAL PRIMARY KEY, 
      email             varchar(255), 
      first_name        varchar(255), 
      last_name         varchar(255),
      admin             boolean,
      avatar            varchar(255),
      profession        varchar(255),
      facebook          varchar(255),
      twitter           varchar(255),
      city              varchar(255),
      state             varchar(255),
      website           varchar(255),
      bio               text,
      address_district  varchar(255),
      funder            boolean DEFAULT false,
      created_at        timestamp without time zone,
      phone             varchar(255)
    );
  ")

  User.any_instance.stub(:avatar_url).and_return("/assets/default-avatar.png")
end
