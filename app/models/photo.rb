class Photo < ActiveRecord::Base
  has_attachment :storage => :file_system,
                 :resize_to => '800x600',
                 :thumbnails => { :thumb => '100x100', :tiny => '50>' },
                 :max_size => 5.megabytes,
                 :content_type => :image,
                 :processor => 'Rmagick'
  validates_as_attachment
end