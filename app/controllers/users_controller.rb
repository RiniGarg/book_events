class UsersController < ApplicationController
 before_filter :signed_in_user, only: [:edit, :update, :reset_password]
 before_filter :correct_user,   only: [:edit, :update, :reset_password]

 def index
  @users = User.paginate(page: params[:page])
end

def new
  @user=User.new
end

def create
  @events = Event.paginate(page: params[:page])
  @user = User.new(params[:user])  
  if @user.save
    sign_in @user
    flash[:success] = "Welcome to BookmyEvents App!"
    redirect_to events_path
  else
   render 'new'
 end
end

def edit
@user = User.find(params[:id])
end

def destroy
  User.find(params[:id]).destroy
  flash[:success] = "User destroyed."
  redirect_to users_url
end

def update
  @user = User.find(params[:id])  
  @user.name = params[:user][:name]
  @user.email = params[:user][:email]
  if @user.save
    flash[:success] = "Profile updated"
    sign_in @user
    redirect_to @user
  else
    render 'edit'
  end
end

def show
 @user = User.find(params[:id])
 @events=@user.events.paginate(page: params[:page])
end

def make_remove_admin
 @user=User.find(params[:id])
 @user.update_attribute(:admin, params[:is_admin])
render :nothing => true
end

def reset_password
  @user=User.find(params[:id])
  render 'reset_password'
end

def update_password
user = User.find(params[:id]) 
if user && user.authenticate(params[:user][:old_password])
    if params[:user][:password] == params[:user][:password_confirmation]
      user.update_attribute(:password, params[:user][:password_confirmation])
        sign_out
        redirect_to '/signin'
    else
        redirect_to reset_password_user_path(user)
        flash[:error] = "Incorrect Password Confirmation"
    end
else
    redirect_to reset_password_user_path(user)
      flash[:error] = "Incorrect Old Password"
end
end


private

def signed_in_user
  unless signed_in?
    store_location
    redirect_to signin_url, notice: "Please sign in."
  end
end

def correct_user
  @user = User.find(params[:id])
  redirect_to(root_url) unless current_user?(@user)
end
end
