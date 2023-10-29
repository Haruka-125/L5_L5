require 'bcrypt'

class TopController < ApplicationController
  attr_accessor :pass
  def main
    if session[:login_uid] != nil
      render "main"
    else
      render "login"
    end
  end

  def login
    logger.debug params[:uid]
    user = User.find_by(uid: params[:uid])
    #puts params[:uid]
    user_pass = BCrypt::Password.create(params[:pass])
    user_password = user.pass
    puts user_pass
    puts user_password
    # if user && BCrypt::Password.new(user.pass) == params[:pass]#and User.find_by(pass: params[:pass]) #login_pass
    #if params[:uid] == "kindai" and params[:pass] == "sanriko"
    if user && BCrypt::Password.new(user_pass) == params[:pass]
      session[:login_uid] = params[:uid]
      puts "1個目のif文クリア"
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
