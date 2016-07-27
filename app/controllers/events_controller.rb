class EventsController < ApplicationController
	before_filter :signed_in_user_admin, only: [:edit, :update]

	def index
    if params.has_key?(:category) && params[:category][:id].present?
     @category = Category.find(params[:category][:id] )
     @events = @category.events.paginate(page: params[:page])
    else
		  @events = Event.paginate(page: params[:page])
    end
	end

	def show
		@event = Event.find(params[:id])
	end

  def new
		@event=Event.new
	end

	def create
		@event = Event.new(params[:event])
	    if @event.save
        @events = Event.paginate(page: params[:page])
	    	flash[:success] = "Event created!"
	        render 'index'
	    else
	      render 'new'
	    end
	end

	def destroy
      Event.find(params[:id]).destroy
    flash[:success] = "Event destroyed."
    redirect_to events_url
	end

	def edit
		@event = Event.find(params[:id])
		render 'edit'
    end

    def update
    	@event=Event.find(params[:id])
    if @event.update_attributes(params[:event])
      flash[:success] = "Event updated"
      redirect_to events_path
    else
      render 'edit'
    end
	end

	private

    def signed_in_user_admin
    	unless signed_in_admin?
        store_location
        redirect_to signin_url, notice: "Please sign in as admin."
      end
    end

end
