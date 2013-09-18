class CreateViewFacts < ActiveRecord::Migration
  def up
    create_view :facts, "
    SELECT c.id, c.created_at, c.name, c.description_html, c.link, c.mobilization_id, 'campaigns' as relname FROM campaigns c
    UNION ALL 
    SELECT p.id, p.created_at, p.name, p.description as description_html, p.link, p.mobilization_id, 'problems' as relname FROM problems p;"
  end

  def down
    drop_view :facts
  end
end
