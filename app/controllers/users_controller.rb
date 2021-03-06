class UsersController < ApplicationController

  def login
  end

  def update
    user = User.find_by(email: params[:session][:email].downcase)
    if User.authenticate(params[:session][:email].downcase, params[:session][:password])
      session[:user_id] = user.id
      redirect_to session[:current_url]
    else
      flash.now[:danger] = "Invalid email/password combination"
      render :login
    end
  end

  def signup
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to '/login'
    else
      render :signup
    end
  end



  def destroy
    @user ||= User.find_by(id: session[:user_id])
    if @user != nil
      session.delete(:user_id)
      puts "SESSION DELETED"
    end
    if request.xhr?
      render :partial => 'layouts/logout', layout: false
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
