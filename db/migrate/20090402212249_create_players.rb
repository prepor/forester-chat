class CreatePlayers < ActiveRecord::Migration
  def self.up
    create_table :players do |t|
      t.integer :crew_id
      t.string :name
      t.boolean :staff, :default => false
      t.integer :status
      t.timestamps
    end
  end

  def self.down
    drop_table :players
  end
end
