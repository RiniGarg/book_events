class BookingsController < ApplicationController


def create
  booking = User.find(params[:user_id]).bookings.where(event_id: params[:event_id]).first
  booking.destroy if booking.present?
  @is_going=params[:is_going]
  @booking = Booking.new
  @booking.update_attribute(:going_id, params[:is_going])
  @booking.update_attribute(:event_id, params[:event_id])
  @booking.update_attribute(:user_id, params[:user_id])
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
