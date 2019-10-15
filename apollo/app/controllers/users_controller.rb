class UsersController < ApplicationController
  def index
    @users = User.all()
  end

  def new
    @user = User.new
  end

  def create
    # require 'pry': binding.pry
    attrs = params.require(:user).permit(:name, :username, :password, :password_confirmation)
    @user = User.new(attrs)
    if @user.save()
      session[:user_id] = @user.id
      flash[:warning] = "Login successful"
      redirect_to users_path
    else
      flash[:warning] = "Wrong username or password"
      render :new
    end
  end

  def show
    @user = User.find(params['id'])
  end

  def edit
    @user = User.find(params['id'])
  end

  def update
    user = User.find(params[:id])
    attrs = params.permit(:name, :username)
    user.update(attrs)
    redirect_to "/users/#{params['id']}"
  end

  # private

  # def per_page
  #   2
  # end

  # def page
  #   params[:page].to_i || 1
  # end

  # def get_offset(page)
  #   per_page * (page - 1)
  # end
end
