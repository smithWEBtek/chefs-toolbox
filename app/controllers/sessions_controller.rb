class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:name])
    if @user.authenticate(params[:password])
      session[:id] = @user.id
      redirect_to @user 
    else
      redirect_to root_path
    end
  end
end