class DropFact < ActiveRecord::Migration
  def up
    drop_view :facts
  end

  def down
    create_view :facts, "
    SELECT c.id, c.created_at, c.name, c.description_html, c.link, c.mobilization_id, 'campaigns' as relname FROM campaigns c
    UNION ALL 
    SELECT p.id, p.created_at, p.name, p.description as description_html, p.link, p.mobilization_id, 'problems' as relname FROM problems p;"
  end
end
