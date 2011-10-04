class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.column :page_id, :integer
      t.column :event_date, :datetime
      t.column :title, :string
      t.column :body, :text
      t.column :created_at, :datetime
      t.column :updated_at, :datetime
    end
    add_index :events, :page_id
  end

  def self.down
    drop_table :events
  end
end
