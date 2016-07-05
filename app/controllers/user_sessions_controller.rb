class UserSessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]

  def new
    @user = User.new
  end

  def create
    if request.env['omniauth.auth'].present?
      @user = User.from_omniauth(request.env['omniauth.auth'])
      session[:user_id] = @user.id
      redirect_back_or_to(root_path, notice: 'Login successful')
    else
      if login(params[:email], params[:password])
        redirect_back_or_to(root_path, notice: 'Login successful')
      else
        flash.now[:alert] = 'Login failed'
        render action: 'new'
      end
    end
  end

  def destroy
    logout
    redirect_to(root_path, notice: 'Logged out!')
  end
end
