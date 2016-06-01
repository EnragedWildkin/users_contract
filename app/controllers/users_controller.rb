class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :require_login, only: [:index, :new, :create]

  def index
    @users = User.all
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
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        login(params[:user][:email], params[:user][:password])

        format.html { redirect_to :users, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
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
      en_user_field_attributes: [
        :first_name,
        :last_name,
        :middle_name,
        :contract_price,
        :location,
        :address,
        :c_a_number,
        :bank_name,
        :bank_address
      ],
      ua_user_field_attributes: [
        :first_name,
        :last_name,
        :middle_name,
        :contract_price,
        :location,
        :address,
        :c_a_number,
        :bank_name,
        :bank_address
      ],
      ru_user_field_attributes: [
        :first_name,
        :last_name,
        :middle_name,
        :contract_price,
        :location,
        :address,
        :c_a_number,
        :bank_name,
        :bank_address
      ]
    )
  end
end
