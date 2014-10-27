class ChangeActivityColumnNames < ActiveRecord::Migration
  def up
    execute "DROP VIEW IF EXISTS activities"
    create_view :activities, "
    SELECT campaigns.name as title,       campaigns.id as activable_id,               campaigns.user_id,                campaigns.created_at,               campaigns.hashtag,                'Campaign' as activable_type                              FROM campaigns                                      UNION ALL
    SELECT pokes_campaigns.name as title, pokes.id as activable_id,                   pokes.user_id,                    pokes.created_at,                   pokes_campaigns.hashtag,          'Poke' as activable_type                                  FROM pokes                                          INNER JOIN campaigns pokes_campaigns ON (pokes_campaigns.id = pokes.campaign_id) UNION ALL
    SELECT problems.name as title,        problems.id as activable_id,                problems.user_id,                 problems.created_at,                problems.hashtag,                 'Problem' as activable_type                               FROM problems                                       UNION ALL
    SELECT ideas_problems.name as title,  ideas.id as activable_id,                   ideas.user_id,                    ideas.created_at,                   ideas_problems.hashtag,           'Idea' as activable_type                                  FROM ideas                                          INNER JOIN problems ideas_problems ON (ideas_problems.id = ideas.problem_id) UNION ALL
    SELECT tasks.title,                   task_subscriptions.id as activable_id,      task_subscriptions.user_id,       task_subscriptions.created_at,      tasks.hashtag,                    'TaskSubscription' as activable_type                      FROM task_subscriptions                             INNER JOIN tasks ON (tasks.id = task_subscriptions.task_id) UNION ALL
    SELECT tasks.title,                   deliveries.id as activable_id,              task_subscriptions.user_id,       deliveries.accepted_at,             tasks.hashtag,                    'Delivery' as activable_type                              FROM deliveries                                     INNER JOIN task_subscriptions ON (task_subscriptions.id = deliveries.task_subscription_id) INNER JOIN tasks ON (tasks.id = task_subscriptions.task_id) WHERE (deliveries.accepted_at IS NOT NULL) UNION ALL
    SELECT compartilhaco_campaigns.title, compartilhaco_campaigns.id as activable_id, compartilhaco_campaigns.user_id,  compartilhaco_campaigns.created_at, compartilhaco_campaigns.hashtag,  'CompartilhacoCampaign' as activable_type                 FROM compartilhaco_campaigns                        UNION ALL
    SELECT cc.title,                      cfps.id as activable_id,                    cfps.user_id,                     cfps.created_at,                    cc.hashtag,                       'CompartilhacoFacebookProfileSpreader' as activable_type FROM compartilhaco_facebook_profile_spreaders cfps  INNER JOIN compartilhaco_campaigns cc ON (cc.id = cfps.campaign_id) UNION ALL
    SELECT cc.title,                      ctps.id as activable_id,                    ctps.user_id,                     ctps.created_at,                    cc.hashtag,                       'CompartilhacoTwitterProfileSpreader' as activable_type  FROM compartilhaco_twitter_profile_spreaders ctps   INNER JOIN compartilhaco_campaigns cc ON (cc.id = ctps.campaign_id)"
  end

  def down
    execute "DROP VIEW IF EXISTS activities"
    create_view :activities, "
    SELECT campaigns.name as title, campaigns.id, campaigns.user_id, campaigns.created_at, campaigns.hashtag, 'campaigns' as relname FROM campaigns
    UNION ALL
    SELECT pokes_campaigns.name as title, pokes.id, pokes.user_id, pokes.created_at, pokes_campaigns.hashtag, 'pokes' as relname FROM pokes INNER JOIN campaigns pokes_campaigns ON (pokes_campaigns.id = pokes.campaign_id)
    UNION ALL
    SELECT problems.name as title, problems.id, problems.user_id, problems.created_at, problems.hashtag, 'problems' as relname FROM problems
    UNION ALL
    SELECT ideas_problems.name as title, ideas.id, ideas.user_id, ideas.created_at, ideas_problems.hashtag, 'ideas' as relname FROM ideas INNER JOIN problems ideas_problems ON (ideas_problems.id = ideas.problem_id)
    UNION ALL
    SELECT tasks.title, task_subscriptions.id, task_subscriptions.user_id, task_subscriptions.created_at, tasks.hashtag, 'task_subscriptions' as relname FROM task_subscriptions INNER JOIN tasks ON (tasks.id = task_subscriptions.task_id)
    UNION ALL
    SELECT tasks.title, deliveries.id, task_subscriptions.user_id, deliveries.accepted_at, tasks.hashtag, 'accepted_deliveries' as relname FROM deliveries INNER JOIN task_subscriptions ON (task_subscriptions.id = deliveries.task_subscription_id) INNER JOIN tasks ON (tasks.id = task_subscriptions.task_id) WHERE (deliveries.accepted_at IS NOT NULL)
    UNION ALL
    SELECT compartilhaco_campaigns.title, compartilhaco_campaigns.id, compartilhaco_campaigns.user_id, compartilhaco_campaigns.created_at, compartilhaco_campaigns.hashtag, 'compartilhaco_campaigns' as relname FROM compartilhaco_campaigns
    UNION ALL
    SELECT cc.title, cfps.id, cfps.user_id, cfps.created_at, cc.hashtag, 'compartilhaco_facebook_profile_spreaders' as relname FROM compartilhaco_facebook_profile_spreaders cfps INNER JOIN compartilhaco_campaigns cc ON (cc.id = cfps.campaign_id)
    UNION ALL
    SELECT cc.title, ctps.id, ctps.user_id, ctps.created_at, cc.hashtag, 'compartilhaco_twitter_profile_spreaders' as relname FROM compartilhaco_twitter_profile_spreaders ctps INNER JOIN compartilhaco_campaigns cc ON (cc.id = ctps.campaign_id)"
  end
end
