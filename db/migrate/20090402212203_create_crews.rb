class CreateCrews < ActiveRecord::Migration
  def self.up
    create_table :crews do |t|
      t.string :title
      t.string :location
      t.integer :version_id
      t.integer :status, :default => 1
      t.timestamps
    end
  end

  def self.down
    drop_table :crews
  end
end
