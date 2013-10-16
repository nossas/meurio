class AddPokesToActivities < ActiveRecord::Migration
  def up
    drop_view :activities
    create_view :activities, "
    SELECT c.id, c.user_id, c.created_at, c.hashtag, 'campaigns' as relname FROM campaigns c
    UNION ALL
    SELECT p.id, p.user_id, p.created_at, pc.hashtag, 'pokes' as relname FROM pokes p INNER JOIN campaigns pc ON (pc.id = p.campaign_id)"
  end
  
  def down
    drop_view :activities
    create_view :activities, "SELECT c.id, c.user_id, c.created_at, c.name, c.hashtag, c.link, 'campaigns' as relname FROM campaigns c"
  end
end
