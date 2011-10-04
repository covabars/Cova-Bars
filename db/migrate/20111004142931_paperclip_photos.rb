class PaperclipPhotos < ActiveRecord::Migration
  def self.up
    add_column :photos, :photo_file_name, :string # Original filename
    add_column :photos, :photo_content_type, :string # Mime type
    add_column :photos, :photo_file_size, :integer # File size in bytes
    add_column :photos, :photo_updated_at, :datetime
  end

  def self.down
    remove_column :photos, :photo_file_name
    remove_column :photos, :photo_content_type
    remove_column :photos, :photo_file_size
    remove_column :photos, :photo_updated_at
  end
end
