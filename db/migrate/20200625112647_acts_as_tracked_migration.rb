class ActsAsTrackedMigration < ActiveRecord::Migration[6.0]
  def self.up
    create_table :activities do |t|
      t.integer :actor_id, index: true
      t.string :actor_type
      t.integer :subject_id, index: true
      t.string :subject_type
      t.integer :parent_id, index: true
      t.string :parent_type
      t.text :attribute_changes
      t.string :activity_type
      t.string :human_description
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :activity
  end
end
