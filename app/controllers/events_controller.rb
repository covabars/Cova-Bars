class EventsController < ApplicationController
  before_filter :check_administrator_role, :except => [:index, :show]

  def index
    if params[:page_id]
      @events = Event.find_all_by_event_date(true)
      @events_pages, @events = paginate(:events,
                                        :order => 'event_date ASC',
                                        :conditions => "page_id=#{params[:page_id].to_i} AND event_date >= DATE(NOW())")
      @page = Page.find(params[:page_id].to_i)
    else
      @events = Event.find_all_by_event_date(true)
      @events = Event.find(:all,
                           :order => 'event_date ASC', 
                           :conditions => "event_date >= DATE(NOW())",
                           :limit => 50)
#      @events_pages, @events = paginate(:events, :order => 'event_date ASC',
#                                                 :conditions => "event_date >= DATE(NOW())")
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
#    @event = Event.create(params[:event])
#    redirect_to admin_events_url
		@event = Event.new(params[:event])
		@event.save!
		flash[:notice] = 'Event saved'
		redirect_to :action => 'admin'
		rescue ActiveRecord::RecordInvalid
		render :action => 'new'
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update_attributes(params[:event])
    redirect_to admin_events_url
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to admin_events_url
  end

  def admin
    @events_pages, @events = paginate(:events,
                                      :order => 'event_date ASC',
                                      :conditions => "event_date >= DATE(NOW())")
  end

end
