class SportsController < ApplicationController
  before_filter :check_administrator_role, :except => [:index, :show]

  def index
    if params[:page_id]
      @sports_pages, @sports = paginate(:sports,
                                        :order => 'event_date DESC',
                                        :conditions => "page_id=#{params[:page_id].to_i} AND event_date >= DATE(NOW())")
    else
      @sports = Sport.find_all_by_event_date(true)
      @sports_pages, @sports = paginate(:sports, :order => 'event_date ASC',
                                                 :conditions => "event_date >= DATE(NOW())")
    end
  end

  def show
    @sport = Sport.find(params[:id])
  end

  def new
    @sport = Sport.new
  end

  def create
#    @sport = Sport.create(params[:sport])
#    redirect_to admin_sports_url
		@sport = Sport.new(params[:sport])
		@sport.save!
		flash[:notice] = 'Sporting Event Saved'
		redirect_to :action => 'admin'
		rescue ActiveRecord::RecordInvalid
		render :action => 'new'
  end

  def edit
    @sport = Sport.find(params[:id])
  end

  def update
    @sport = Sport.find(params[:id])
    @sport.update_attributes(params[:sport])
    redirect_to admin_sports_url
  end

  def destroy
    @sport = Sport.find(params[:id])
    @sport.destroy
    flash[:notice] = 'Sporting Event Deleted'
    redirect_to admin_sports_url
  end

  def admin
    @sports_pages, @sports = paginate(:sports,
                                      :order => 'event_date ASC',
                                      :conditions => "event_date >= DATE(NOW())")
  end

end