class AddEventsToViewFacts < ActiveRecord::Migration
  def up
    create_view :facts, "
    SELECT c.id, c.created_at, c.name, c.description_html, c.link, c.hashtag, 'campaigns' as relname FROM campaigns c
    UNION ALL 
    SELECT p.id, p.created_at, p.name, p.description as description_html, p.link, p.hashtag, 'problems' as relname FROM problems p
    UNION ALL
    SELECT e.id, e.created_at, e.name, e.description as description_html, e.link, e.hashtag, 'events' as relname FROM events e;"
  end

  def down
    drop_view :facts
    create_view :facts, "
    SELECT c.id, c.created_at, c.name, c.description_html, c.link, c.mobilization_id, 'campaigns' as relname FROM campaigns c
    UNION ALL 
    SELECT p.id, p.created_at, p.name, p.description as description_html, p.link, p.mobilization_id, 'problems' as relname FROM problems p;"
  end
end
