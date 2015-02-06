class SessionsController < ApplicationController
 def new
 end
 
 def create
   user = User.where(username: params[:username]).first  # or User.find ()...
   if user && user.authenticate(params[:password])
     session[:user_id] = user.id  # only store id and not the whole user object for size
     flash[:notice] = "You've successfully logged in"
     redirect_to root_path
   else
     flash.now[:error] = "Username or password is not right"
     render :new
   end
 end
 
 def destroy
   session[:user_id] = nil
   flash[:notice] = "You've logged out"
   redirect_to root_path
 end
end
