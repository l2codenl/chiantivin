class Admin::UsersController < ApplicationController
  layout 'admin'
  before_filter :authorize
  def new
    @user = User.new
  end
  def index
    @users = User.all
  end
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to admin_users_path, :notice => "User created!"
    else
      render "new"
    end
  end
  def destroy
    if params[:id] == 1
      redirect_to admin_users_path, :notice => "Main user can't be deleted!"
    end
    @user = User.find_by_id(params[:id])
    @user.Destroy
    redirect_to admin_users_path, :notice => "User deleted!"
  end
end
