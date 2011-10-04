class PhotosController < ApplicationController

  def admin
    @photos = Photo.find(:all,
                         :conditions => "thumbnail is NULL",
                         :order => 'created_at DESC')
  end

  def index
    #photos_count = Photo.count(:conditions => "thumbnail = 'thumb'")
    photos_count = Photo.count(:conditions => "thumbnail is NULL")
    @photo_pages = Paginator.new(self, photos_count, 10, params[:page])
 #   @photos = Photo.find(:all,
 #                        :conditions => "thumbnail = 'thumb'",
 #                        :order => 'created_at DESC',
 #                        :limit => @photo_pages.items_per_page,
 #                        :offset => @photo_pages.current.offset)
    @photos = Photo.find(:all,
                         :conditions => "thumbnail is NULL",
                         :order => 'created_at DESC',
                         :limit => @photo_pages.items_per_page,
                         :offset => @photo_pages.current.offset)
  end


  def show
    @photo = Photo.find(params[:id].to_i)
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(params[:photo])
    @photo.save!
    flash[:notice] = 'Photo saved'
    redirect_to :action => 'index'
    rescue ActiveRecord::RecordInvalid
      render :action => 'new'
  end

  def edit
    @photo = Photo.find(params[:id].to_i)
  end

  def update
    @photo = Photo.find(params[:id].to_i)
    @photo.attributes = params[:photo]
    @photo.save!
    flash[:notice] = "Menu updated"
    redirect_to :action => 'index'
    rescue
    render :action => 'edit'
  end

  def destroy
    @photo = Photo.find(params[:id].to_i)
    if @photo.destroy
      flash[:notice] = "Photo Deleted"
    else
      flash[:error] = "Photo NOT Deleted"
    end
    redirect_to :action => 'index'
  end

end
