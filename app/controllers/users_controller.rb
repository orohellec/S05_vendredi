class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new
    params_user = params[:user]
    number_users = User.count
    User.create(first_name: params_user[:first_name], last_name: params_user[:last_name], email: params_user[:email], password_digest: BCrypt::Password.create(params_user[:password]))

    if number_users < User.count
      flash[:success] = 'Votre compte à bien été créé'
      redirect_to '/login'
    else
      flash[:danger] = 'Champs incorrectes'
      render 'new'
    end
  end

  def club
    if session[:user_id]
      @all_users = User.all
    else
      redirect_to '/'
    end
  end
end
