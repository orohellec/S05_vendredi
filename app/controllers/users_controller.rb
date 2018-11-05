class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create

    params_user = params[:user]

    User.create(first_name: params_user[:first_name], last_name: params_user[:last_name], email: params_user[:email], password_digest: BCrypt::Password.create(params_user[:password]))
  end

  def club
    @all_users = User.all
  end
end
