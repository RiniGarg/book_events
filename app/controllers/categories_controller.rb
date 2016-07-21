class CategoriesController < ApplicationController
before_filter :signed_in_user_admin, only: [:edit, :update]
 
     def new
		@category=Category.new
	end

	def index
       @categories = Category.paginate(page: params[:page])
	end

	def show
		@category = Category.find(params[:id])
	end

	def create
    @categories=Category.paginate(page: params[:page])
		@category = Category.new(params[:category])
	    if @category.save
	    	flash[:success] = "Category created!"
	        render 'index'
	    else
	      render 'new'
	    end
	end

	def destroy
		Category.find(params[:id]).destroy
    flash[:success] = "Category destroyed."
    redirect_to categories_url
	 end

	 def edit
	 	@category = Category.find(params[:id])
		render 'edit'
    end

    def update
      #byebug
      @categories=Category.paginate(page: params[:page])
    	@category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      flash[:success] = "Category updated"
      render 'index'
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
