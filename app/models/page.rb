class Page < ActiveRecord::Base
#  has_attachment :storage => :file_system,
#                 :resize_to => '176x133',
#                 :thumbnails => { :thumb => '176x133', :tiny => '100>' },
#                 :max_size => 5.megabytes,
#                 :content_type => :image,
#                 :processor => 'Rmagick'
#  validates_as_attachment

  validates_presence_of :title, :body #, :synopsis
  validates_length_of :title, :within => 3..255

  has_many :events
  has_many :sports

  def before_create
    @attributes['permalink'] =
    title.downcase.gsub(/\s+/, '_').gsub(/[^a-zA-Z0-9_]+/, '')
  end 
	
  def to_param
#    "#{id}-#{permalink}"
    "#{permalink}"
  end

  def outputstyle_name
    if id == 1
      " home"
    elsif id == 2
      " saloon"
    elsif id == 3
      " zodiacbar"
    elsif id == 4
      " flandersbar"
    else
      " viewall"
    end
  end

  def outputlink_image
    if id == 1
      # home
      "<a href=""/pages/5-food""><img src=""/images/foodbtn.png"" alt=""foodbtn"" title=""Food at Bruxelles"" width=""220"" height=""32""/></a>"
    elsif id == 2
      # saloon
      "<a href=""/events""><img src=""/images/viewallevents.png"" alt=""upcomingeventsbtn"" title=""View Coming Events at Bruxelles"" width=""220"" height=""32""/></a>"
    elsif id == 3
      # zodiacbar
      "<a href=""/events""><img src=""/images/viewallevents.png"" alt=""upcomingeventsbtn"" title=""View Coming Events at Bruxelles"" width=""220"" height=""32""/></a>"
    elsif id == 4
      # flandersbar
      "<a href=""/events""><img src=""/images/viewallevents.png"" alt=""upcomingeventsbtn"" title=""View Coming Events at Bruxelles"" width=""220"" height=""32""/></a>"
    else
      # viewall
    end
  end

end
