class FoodsController < ApplicationController

  before_filter :check_administrator_role, :except => [:show]

  def admin
    @foods = Food.find(:all)
  end

  def index
    @foods = Food.find(:all)
  end

  def show
    @food = Food.find_by_permalink(params[:id])
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(params[:food])
    @food.save!
    flash[:notice] = 'Menu saved'
    redirect_to :action => 'index'
    rescue ActiveRecord::RecordInvalid
    render :action => 'new'
  end

  def edit
    @food = Food.find_by_permalink(params[:id])
  end

  def update
    @food = Food.find_by_permalink(params[:id])
    @food.attributes = params[:food]
    @food.save!
    flash[:notice] = "Menu updated"
    redirect_to :action => 'index'
    rescue
    render :action => 'edit'
  end

  def destroy
    @food = Food.find_by_permalink(params[:id])
    if @food.destroy
      flash[:notice] = "Menu Deleted"
    else
      flash[:error] = "Menu NOT Deleted"
    end
    redirect_to :action => 'index'
  end

end
