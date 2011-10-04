class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.column :title, :string
      t.column :body, :text
      t.column :created_at, :datetime
      
      t.column :content_type, :string, :limit => 100
      t.column :filename, :string, :limit => 255
      t.column :path, :string, :limit => 255
      t.column :parent_id, :integer
      t.column :thumbnail, :string, :limit => 255
      t.column :size, :integer
      t.column :width, :integer
      t.column :height, :integer
    end
  end

  def self.down
    drop_table :photos
  end
end
