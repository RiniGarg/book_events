class BookingsController < ApplicationController


def create
  @is_going=params[:is_going]
  @booking = Booking.new
  @booking.update_attribute(:going_id, params[:is_going])
  @booking.update_attribute(:event_id, params[:event_id])
  @booking.update_attribute(:user_id, params[:user_id])
  #@booking.update_counter_cache
end




def edit

end

def destroy

end

def update
  
end

def show
 
end

def index
      @bookings = Booking.paginate(page: params[:page])
end
  
	
end
