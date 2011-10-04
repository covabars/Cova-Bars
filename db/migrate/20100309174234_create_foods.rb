class CreateFoods < ActiveRecord::Migration

	def self.up
		create_table :foods do |t|
			t.column :title, :string
			t.column :permalink, :string
			t.column :body, :text
			t.column :created_at, :datetime
			t.column :updated_at, :datetime
			t.column :opening, :string, :limit => 250, :null => false
		end

		Food.create(:title => "Breakfast Menu",
						:permalink => "breakfast",
						:body => "<p>Menu goes here</p>")

		Food.create(:title => "Lunch Menu",
						:permalink => "lunch",
						:body => "<p>Menu goes here</p>")

		Food.create(:title => "Evening Menu",
						:permalink => "evening",
						:body => "<p>Menu goes here</p>")

	end

	def self.down
		drop_table :foods
	end

end

