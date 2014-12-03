class CreateRecentActivities < ActiveRecord::Migration
  def up
    execute <<-SQL
      CREATE VIEW recent_activities AS
      (SELECT problems.name as title,              problems.id as activable_id,                problems.user_id,                 problems.created_at,                problems.hashtag,                 'Problem' as activable_type                               FROM problems                                       LIMIT 10)  UNION ALL
      (SELECT ideas_problems.name as title,        ideas.id as activable_id,                   ideas.user_id,                    ideas.created_at,                   ideas_problems.hashtag,           'Idea' as activable_type                                  FROM ideas                                          INNER JOIN problems ideas_problems ON (ideas_problems.id = ideas.problem_id) LIMIT 10) UNION ALL
      (SELECT tasks.title,                         task_subscriptions.id as activable_id,      task_subscriptions.user_id,       task_subscriptions.created_at,      tasks.hashtag,                    'TaskSubscription' as activable_type                      FROM task_subscriptions                             INNER JOIN tasks ON (tasks.id = task_subscriptions.task_id) LIMIT 10) UNION ALL
      (SELECT tasks.title,                         deliveries.id as activable_id,              task_subscriptions.user_id,       deliveries.accepted_at,             tasks.hashtag,                    'Delivery' as activable_type                              FROM deliveries                                     INNER JOIN task_subscriptions ON (task_subscriptions.id = deliveries.task_subscription_id) INNER JOIN tasks ON (tasks.id = task_subscriptions.task_id) WHERE (deliveries.accepted_at IS NOT NULL) LIMIT 10) UNION ALL
      (SELECT compartilhaco_campaigns.title,       compartilhaco_campaigns.id as activable_id, compartilhaco_campaigns.user_id,  compartilhaco_campaigns.created_at, compartilhaco_campaigns.hashtag,  'CompartilhacoCampaign' as activable_type                 FROM compartilhaco_campaigns                        LIMIT 10)  UNION ALL
      (SELECT cc.title,                            cfps.id as activable_id,                    cfps.user_id,                     cfps.created_at,                    cc.hashtag,                       'CompartilhacoFacebookProfileSpreader' as activable_type  FROM compartilhaco_facebook_profile_spreaders cfps  INNER JOIN compartilhaco_campaigns cc ON (cc.id = cfps.campaign_id) LIMIT 10) UNION ALL
      (SELECT cc.title,                            ctps.id as activable_id,                    ctps.user_id,                     ctps.created_at,                    cc.hashtag,                       'CompartilhacoTwitterProfileSpreader' as activable_type   FROM compartilhaco_twitter_profile_spreaders ctps   INNER JOIN compartilhaco_campaigns cc ON (cc.id = ctps.campaign_id) LIMIT 10) UNION ALL
      (SELECT panela_campaigns.name as title,      panela_campaigns.id as activable_id,        panela_campaigns.user_id,         panela_campaigns.created_at,        panela_campaigns.hashtag,         'PanelaCampaign' as activable_type                        FROM panela_campaigns                               LIMIT 10)  UNION ALL
      (SELECT panela_poke_campaigns.name as title, panela_pokes.id as activable_id,            panela_pokes.user_id,             panela_pokes.created_at,            panela_poke_campaigns.hashtag,    'PanelaPoke' as activable_type                            FROM panela_pokes                                   INNER JOIN panela_campaigns panela_poke_campaigns ON (panela_poke_campaigns.id = panela_pokes.campaign_id) LIMIT 10)
      ORDER BY created_at DESC;
    SQL
  end

  def down
    execute <<-SQL
      DROP VIEW IF EXISTS recent_activities;
    SQL
  end
end
