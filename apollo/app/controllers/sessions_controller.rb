class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:username])
      session[:user_id] = user.id
      flash[:notice] = 'lets go!'
      redirect_to submissons_path
    else
      redirect_to :back
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :login
  end
end
