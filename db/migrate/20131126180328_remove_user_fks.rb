class RemoveUserFks < ActiveRecord::Migration
  def up
    execute <<-SQL
        DROP INDEX IF EXISTS fk__campaigns_user_id;
        DROP INDEX IF EXISTS fk__campaigns_user_id;
        DROP INDEX IF EXISTS fk__problems_user_id;
        DROP INDEX IF EXISTS fk__ideas_user_id;
        DROP INDEX IF EXISTS fk__pokes_user_id;
        DROP INDEX IF EXISTS fk__mobilizations_user_id;
    SQL
  end

  def down
  end
end
