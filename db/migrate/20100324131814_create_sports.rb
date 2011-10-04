class CreateSports < ActiveRecord::Migration
  def self.up
    create_table :sports do |t|
      t.column :page_id, :integer
      t.column :event_date, :datetime
      t.column :title, :string
      t.column :body, :text
      t.column :created_at, :datetime
      t.column :updated_at, :datetime
    end
    add_index :sports, :page_id

    Sport.create(:page_id => 2,
                :event_date => "14-Apr-2010",
                :title => "Test Sporting Event",
                :body => "<p>Sporting Information</p>")
  end

  def self.down
    drop_table :sports
  end
end
