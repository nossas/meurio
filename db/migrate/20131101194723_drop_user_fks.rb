class DropUserFks < ActiveRecord::Migration
  def up
    execute <<-SQL
        ALTER TABLE campaigns DROP CONSTRAINT fk_campaigns_user_id;
        ALTER TABLE pokes DROP CONSTRAINT fk_pokes_user_id;
        ALTER TABLE ideas DROP CONSTRAINT fk_ideas_user_id;
        ALTER TABLE problems DROP CONSTRAINT fk_problems_user_id;
        ALTER TABLE mobilizations DROP CONSTRAINT fk_mobilizations_user_id;
    SQL
  end

  def down
  end
end
