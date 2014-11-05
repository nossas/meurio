class RemoveCampaignTableFromFactsView < ActiveRecord::Migration
  def up
    drop_view :facts
    create_view :facts, <<-SQL
      SELECT e.id,                e.created_at,                 e.name,                 e.description_html,                               e.link,     e.hashtag,                'petitions' as relname                FROM petitions e UNION ALL
      SELECT p.id,                p.created_at,                 p.name,                 p.description as description_html,                p.link,     p.hashtag,                'problems' as relname                 FROM problems p UNION ALL
      SELECT e.id,                e.created_at,                 e.name,                 e.description as description_html,                e.link,     e.hashtag,                'events' as relname                   FROM events e UNION ALL
      SELECT cc.id,               cc.created_at,                cc.title as name,       cc.description as description_html,               '' as link, cc.hashtag,               'compartilhaco_campaigns' as relname  FROM compartilhaco_campaigns cc UNION ALL
      SELECT panela_campaigns.id, panela_campaigns.created_at,  panela_campaigns.name,  panela_campaigns.description as description_html, '' as link, panela_campaigns.hashtag, 'panela_campaigns' as relname         FROM panela_campaigns
    SQL
  end

  def down
    drop_view :facts
    create_view :facts, <<-SQL
      SELECT e.id,                e.created_at,                 e.name,                 e.description_html,                               e.link,     e.hashtag,                'petitions' as relname                FROM petitions e UNION ALL
      SELECT c.id,                c.created_at,                 c.name,                 c.description_html,                               c.link,     c.hashtag,                'campaigns' as relname                FROM campaigns c UNION ALL
      SELECT p.id,                p.created_at,                 p.name,                 p.description as description_html,                p.link,     p.hashtag,                'problems' as relname                 FROM problems p UNION ALL
      SELECT e.id,                e.created_at,                 e.name,                 e.description as description_html,                e.link,     e.hashtag,                'events' as relname                   FROM events e UNION ALL
      SELECT cc.id,               cc.created_at,                cc.title as name,       cc.description as description_html,               '' as link, cc.hashtag,               'compartilhaco_campaigns' as relname  FROM compartilhaco_campaigns cc UNION ALL
      SELECT panela_campaigns.id, panela_campaigns.created_at,  panela_campaigns.name,  panela_campaigns.description as description_html, '' as link, panela_campaigns.hashtag, 'panela_campaigns' as relname         FROM panela_campaigns
    SQL
  end
end
