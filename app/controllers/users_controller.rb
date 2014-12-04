class UsersController < ApplicationController
  before_action :authenticate_user!
 
   def update
     if current_user.update_attributes(user_params)
       flash[:notice] = "User information updated"
       redirect_to edit_user_registration_path
     else
       render "devise/registrations/edit"
     end
   end
 
   private
 
   def user_params
     params.require(:user).permit(:name)
   end

  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        UserMailer.welcome_email(@user).deliver_later
 
        format.html { redirect_to(@user, notice: 'User was successfully created.') }
      else
        format.html { render action: 'new' }
      end
    end
  end
end
