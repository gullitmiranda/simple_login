class SessionsController < ApplicationController
  def new
  end

  def create
    email     = params[:email]
    password  = params[:password]

    if user = User.login(email, password)
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to new_sessions_url, alert: "Email o senha inválida"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_sessions_path
  end
end
