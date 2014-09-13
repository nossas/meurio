class AddCompartilhacoCampaignToViewActivities < ActiveRecord::Migration
  def up
    execute "DROP VIEW IF EXISTS activities"
    create_view :activities, "
    SELECT campaigns.id, campaigns.user_id, campaigns.created_at, campaigns.hashtag, 'campaigns' as relname FROM campaigns
    UNION ALL
    SELECT pokes.id, pokes.user_id, pokes.created_at, pokes_campaigns.hashtag, 'pokes' as relname FROM pokes INNER JOIN campaigns pokes_campaigns ON (pokes_campaigns.id = pokes.campaign_id)
    UNION ALL
    SELECT problems.id, problems.user_id, problems.created_at, problems.hashtag, 'problems' as relname FROM problems
    UNION ALL
    SELECT ideas.id, ideas.user_id, ideas.created_at, ideas_problems.hashtag, 'ideas' as relname FROM ideas INNER JOIN problems ideas_problems ON (ideas_problems.id = ideas.problem_id)
    UNION ALL
    SELECT task_subscriptions.id, task_subscriptions.user_id, task_subscriptions.created_at, tasks.hashtag, 'task_subscriptions' as relname FROM task_subscriptions INNER JOIN tasks ON (tasks.id = task_subscriptions.task_id)
    UNION ALL
    SELECT deliveries.id, task_subscriptions.user_id, deliveries.accepted_at, tasks.hashtag, 'accepted_deliveries' as relname FROM deliveries INNER JOIN task_subscriptions ON (task_subscriptions.id = deliveries.task_subscription_id) INNER JOIN tasks ON (tasks.id = task_subscriptions.task_id) WHERE (deliveries.accepted_at IS NOT NULL)
    UNION ALL
    SELECT compartilhaco_campaigns.id, compartilhaco_campaigns.user_id, compartilhaco_campaigns.created_at, compartilhaco_campaigns.hashtag, 'compartilhaco_campaigns' as relname FROM compartilhaco_campaigns"
  end

  def down
    execute "DROP VIEW IF EXISTS activities"
    create_view :activities, "
    SELECT campaigns.id, campaigns.user_id, campaigns.created_at, campaigns.hashtag, 'campaigns' as relname FROM campaigns
    UNION ALL
    SELECT pokes.id, pokes.user_id, pokes.created_at, pokes_campaigns.hashtag, 'pokes' as relname FROM pokes INNER JOIN campaigns pokes_campaigns ON (pokes_campaigns.id = pokes.campaign_id)
    UNION ALL
    SELECT problems.id, problems.user_id, problems.created_at, problems.hashtag, 'problems' as relname FROM problems
    UNION ALL
    SELECT ideas.id, ideas.user_id, ideas.created_at, ideas_problems.hashtag, 'ideas' as relname FROM ideas INNER JOIN problems ideas_problems ON (ideas_problems.id = ideas.problem_id)
    UNION ALL
    SELECT task_subscriptions.id, task_subscriptions.user_id, task_subscriptions.created_at, tasks.hashtag, 'task_subscriptions' as relname FROM task_subscriptions INNER JOIN tasks ON (tasks.id = task_subscriptions.task_id)
    UNION ALL
    SELECT deliveries.id, task_subscriptions.user_id, deliveries.accepted_at, tasks.hashtag, 'accepted_deliveries' as relname FROM deliveries INNER JOIN task_subscriptions ON (task_subscriptions.id = deliveries.task_subscription_id) INNER JOIN tasks ON (tasks.id = task_subscriptions.task_id) WHERE (deliveries.accepted_at IS NOT NULL)"
  end
end
