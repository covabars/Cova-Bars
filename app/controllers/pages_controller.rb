class PagesController < ApplicationController

  before_filter :check_administrator_role, :except => [:index, :show, :send_mail]

  def index
    #@pages = Page.find(:all)
    @page = Page.find(1)
    @pageevents = Event.find(:all, 
                             :limit => 3,
                             :conditions => "page_id = #{@page.id} AND event_date >= DATE(NOW())",
                             :order => 'event_date ASC')
    @pagesports = Sport.find(:all, 
                             :limit => 3,
                             :conditions => "page_id = #{@page.id} AND event_date >= DATE(NOW())",
                             :order => 'event_date ASC')
  end

  def show
#    @page = Page.find(params[:id].to_i)
    @page = Page.find(:first, :conditions => {:permalink => params[:id].to_s})
    @foods = Food.find(:all)

    @pageevents = Event.find(:all, 
                             :limit => 3,
                             :conditions => "page_id = #{@page.id} AND event_date >= DATE(NOW())",
                             :order => 'event_date ASC')
    @pagesports = Sport.find(:all, 
                             :limit => 3,
                             :conditions => "page_id = #{@page.id} AND event_date >= DATE(NOW())",
                             :order => 'event_date ASC')
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(params[:page])
    @page.save!
    flash[:notice] = 'Page saved'
    redirect_to :action => 'admin'
    rescue ActiveRecord::RecordInvalid
    render :action => 'new'
  end

  def edit
#    @page = Page.find(params[:id].to_i)
    @page = Page.find(:first, :conditions => {:permalink => params[:id].to_s})
  end

  def update
#    @page = Page.find(params[:id].to_i)
    @page = Page.find(:first, :conditions => {:permalink => params[:id].to_s})
    @page.attributes = params[:page]
    @page.save!
    flash[:notice] = "Page updated"
    redirect_to :action => 'admin'
    #rescue 
    #flash[:error] = "Page NOT Updated, a problem occurred"
    #render :action => 'edit'
  end

  def destroy
    @page = Page.find(params[:id].to_i)
    if @page.destroy
      flash[:notice] = "Page Deleted"
    else
      flash[:error] = "Page NOT Deleted"
    end
    redirect_to :action => 'index'
  end

  def admin
    @pages = Page.find(:all)
    @page = Page.find(1)

    @pageevents = Event.find(:all, 
                             :limit => 3,
                             :conditions => "page_id = #{@page.id} AND event_date >= DATE(NOW())",
                             :order => 'event_date ASC')
    @pagesports = Sport.find(:all, 
                             :limit => 3,
                             :conditions => "page_id = #{@page.id} AND event_date >= DATE(NOW())",
                             :order => 'event_date ASC')

  end

  def send_mail
      Emailer::deliver_contact_email(params[:email])
      @page = Page.find(8)
  end

end
