class HolidaysController < ApplicationController
  def index
    if current_user.id == 14
      @holidays = Holiday.all
    else
      @holidays = Holiday.find_all_by_user_id(current_user.id)
    end
   
  end

  def show
    @holiday = Holiday.find(params[:id])
  end

  def new
    @holiday = Holiday.new
  end

  def create
    @holiday = Holiday.new(params[:holiday])
    @holiday.user_id = current_user.id
    if @holiday.save
      flash[:notice] = "New Holiday Booking Successfully Created"
      redirect_to @holiday
    else
      render :action => 'new'
    end
  end

  def edit
    @holiday = Holiday.find(params[:id])
  end

  def update
    @holiday = Holiday.find(params[:id])
    if @holiday.update_attributes(params[:holiday])
      flash[:notice] = "Holiday Booking Successfully Updated"
      redirect_to @holiday
    else
      render :action => 'edit'
    end
  end

  def destroy
    @holiday = Holiday.find(params[:id])
    @holiday.destroy
    flash[:notice] = "Holiday Booking Successfully Removed"
    redirect_to holidays_url
  end
end
