class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    puts params[:session][:password]
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      session[:user_id] = user.id
      flash[:success] = 'Vous êtes bien connecté'
      redirect_to "/"
    else
      # Create an error message.
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  def destroy
  #  session[:user_id] = nil
    session.destroy
    redirect_to '/'
  end
end
