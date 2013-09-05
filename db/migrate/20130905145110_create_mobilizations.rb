class CreateMobilizations < ActiveRecord::Migration
  def change
    create_table :mobilizations do |t|

      t.timestamps
    end
  end
end
