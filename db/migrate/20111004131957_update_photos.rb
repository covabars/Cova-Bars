class UpdatePhotos < ActiveRecord::Migration
  def self.up
    remove_column :photos, :content_type
    remove_column :photos, :filename
    remove_column :photos, :path
    remove_column :photos, :parent_id
    remove_column :photos, :thumbnail
    remove_column :photos, :size
    remove_column :photos, :width
    remove_column :photos, :height
  end

  def self.down
    add_column :photos, :content_type, :string, :limit => 100
    add_column :photos, :filename, :string, :limit => 255
    add_column :photos, :path, :string, :limit => 255
    add_column :photos, :parent_id, :integer
    add_column :photos, :thumbnail, :string, :limit => 255
    add_column :photos, :size, :integer
    add_column :photos, :width, :integer
    add_column :photos, :height, :integer
  end
end
