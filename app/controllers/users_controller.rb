require 'bcrypt'
class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  # def create
    # user_pass = BCrypt::Password.create(params[:pass])
    # if User.find_by(uid: params[:uid])
    #   render "error"
    # else
    #   @user = User.new(uid: params[:uid], pass: user_pass)
    
    #   if @user.save
    #     # flash[:notice] = '1レコード追加しました'
    #     redirect_to root_path
    #   else
    #     render 'new'
    #   end
    # end
  #end
    
  def create
    @user = User.new(
      uid: params[:user][:uid],
      password: params[:user][:password],
      password_confirmation: params[:user][:password_confirmation])
    if @user.save
      redirect_to root_path
    else
      render 'new'
    end
  end
    
  

  def destroy
    user = User.find(params[:id])
    user.destroy
    # flash[:notice] = '1レコード削除しました'
    redirect_to root_path
  end
end
