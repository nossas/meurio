class CreateActivities < ActiveRecord::Migration
  def up
    create_view :activities, "SELECT c.id, c.user_id, c.created_at, c.name, c.hashtag, c.link, 'campaigns' as relname FROM campaigns c"
  end

  def down
    drop_view :activities
  end
end
