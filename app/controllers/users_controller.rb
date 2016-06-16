class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :check_permissions
  skip_before_action :require_login, only: [:new, :create]

  def index
    @users = User.where.not(role: Role.find_by_name('admin'))
  end

  def show
  end

  def new
    @user = User.new
    @user.build_en_user_field
    @user.build_ua_user_field
    @user.build_ru_user_field
  end

  def edit
    @edit_admin = @user.admin?
  end

  def create
    @user = User.new(user_params)
    @user.skip_email_and_password_validation if admin?

    if @user.save
      login(params[:user][:email], params[:user][:password])

      redirect_to root_path, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to root_path, notice: 'User was successfully updated.'
    else
      @edit_admin = @user.admin? if admin?
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path, notice: 'User was successfully destroyed.'
  end

  private
  def admin?
    current_user && current_user.admin?
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation,
      :taxpayer_id,
      :register_number,
      :register_number_start_date,
      :swift_code,
      :iban_number,
      :bank_code,
      :passport_number,
      :intermediary_bank_name,
      :intermediary_bank_swift_code,
      en_user_field_attributes: user_field_attributes,
      ua_user_field_attributes: user_field_attributes,
      ru_user_field_attributes: user_field_attributes
    )
  end

  def user_field_attributes
    [
      :first_name,
      :last_name,
      :middle_name,
      :contract_price,
      :location,
      :address,
      :passport_issued_by,
      :c_a_number,
      :bank_name,
      :bank_address
    ]
  end

  def check_permissions
    unless @user == current_user || current_user.admin?
      flash[:alert] = 'Permission denied'
      redirect_to user_path(current_user)
    else
      return true
    end
  end
end
