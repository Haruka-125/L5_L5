require 'bcrypt'

class TopController < ApplicationController
  attr_accessor :pass
  def main
    if current_user != nil
      render "main"
    else
      render "login"
    end
  end

  def login
    user = User.find_by(uid: params[:uid])
    if user && BCrypt::Password.new(user.pass) == params[:pass]
      session[:login_uid] = params[:uid]
      redirect_to root_path
      
    else
      render "error"
    end
  end

  def logout
    session.delete(:login_uid)
    redirect_to root_path
  end
end
