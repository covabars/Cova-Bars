# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Pick a unique cookie name to distinguish our session data from others
  session :session_key => '_bruxelles_session_id'

  include LoginSystem

  def initialize
    super

    @menupages = Page.find(:all,
                           :conditions => "id IN (2,3,4,7,8)")
    @foods = Food.find(:all)
    @rcevents = Event.find(:all,
                           :limit => 3,
                           :order => 'event_date ASC',
                           :conditions => "event_date >= DATE(NOW())")
    @rcsports = Sport.find(:all,
                            :limit => 3,
                            :order => 'event_date ASC',
                            :conditions => "event_date >= DATE(NOW())")

    if (RAILS_ENV == :production)
      @rcphoto = Photo.find(:first, :order => 'random()')
    else
      @rcphoto = Photo.find(:first, :order => 'RAND()')
    end

  end

end
