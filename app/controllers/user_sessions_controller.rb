class UserSessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]

  def new
    @user = User.new
  end

  def create
    if login(params[:email], params[:password])
      if current_user.admin?
        redirect_back_or_to(new_contract_path, notice: 'Login successful')
      else
        redirect_back_or_to(current_user, notice: 'Login successful')
      end
    else
      flash.now[:alert] = 'Login failed'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(:users, notice: 'Logged out!')
  end
end
