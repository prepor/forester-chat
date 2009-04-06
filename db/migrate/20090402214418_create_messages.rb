class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.text :text
      t.integer :player_id
      t.integer :crew_id
      t.string :vis

      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
