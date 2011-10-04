class CreatePages < ActiveRecord::Migration

	def self.up
		create_table :pages do |t|
			t.column :title, :string
			t.column :permalink, :string
			t.column :body, :text
			t.column :created_at, :datetime
			t.column :updated_at, :datetime
			t.column :synopsis, :string
			t.column :content_type, :string
			t.column :filename, :string
			t.column :path, :string
			t.column :thumbnail, :string
			t.column :size, :integer
			t.column :width, :integer
			t.column :height, :integer
		end

		Page.create(:title => "Cova Bars",
						:permalink => "home",
						:body => "<p><strong>Cova Bars</strong>")
	end

	def self.down
		drop_table :pages
	end

end
