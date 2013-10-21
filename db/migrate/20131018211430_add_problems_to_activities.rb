class AddProblemsToActivities < ActiveRecord::Migration
  def up
    drop_view :activities
    create_view :activities, "
    SELECT campaigns.id, campaigns.user_id, campaigns.created_at, campaigns.hashtag, 'campaigns' as relname FROM campaigns
    UNION ALL
    SELECT pokes.id, pokes.user_id, pokes.created_at, pokes_campaigns.hashtag, 'pokes' as relname FROM pokes INNER JOIN campaigns pokes_campaigns ON (pokes_campaigns.id = pokes.campaign_id)
    UNION ALL
    SELECT problems.id, problems.user_id, problems.created_at, problems.hashtag, 'problems' as relname FROM problems"
  end
  
  def down
    drop_view :activities
    create_view :activities, "
    SELECT c.id, c.user_id, c.created_at, c.hashtag, 'campaigns' as relname FROM campaigns c
    UNION ALL
    SELECT p.id, p.user_id, p.created_at, pc.hashtag, 'pokes' as relname FROM pokes p INNER JOIN campaigns pc ON (pc.id = p.campaign_id)"
  end
end
