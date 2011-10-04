class Photo < ActiveRecord::Base
  # Paperclip
  has_attached_file :photo, :styles => { :thumb=> "100x100#",:medium  => "300x300>" }
end
