# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController

  def select
  end

  def new
    @user = User.new 
  end

  def confirm_phone
    # newで入力した情報をuser_paramsを通してsessionに入れる記述
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:nickname] = user_params[:nickname]
    session[:family_name] = user_params[:family_name]
    session[:first_name] = user_params[:first_name]
    session[:family_name_kana] = user_params[:family_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:birthday_year] = user_params[:birthday_year]
    session[:birthday_month] = user_params[:birthday_month]
    session[:birthday] =  user_params[:birthday]

    # @userにuser_paramsの内容をカラム名に代入する。
    @user = User.new(
      email: user_params[:email],
      password: user_params[:password],
      password_confirmation: user_params[:password_confirmation],
      nickname: user_params[:nickname],
      family_name: user_params[:family_name],
      first_name: user_params[:first_name],
      family_name_kana: user_params[:family_name_kana],
      first_name_kana: user_params[:first_name_kana],
      birthday_year: user_params[:birthday_year],
      birthday_month: user_params[:birthday_month],
      birthday: user_params[:birthday],
      cellphone_number: "09011001100"
    )

    #代入した@userをバリデーションエラー判定にかけ、バリデーションにかかったときはrederでnew 
    render 'devise/registrations/new' unless @user.valid?

    @user = User.new
    @address = Address.new
  end

  def new_address
    
    session[:cellphone_number] = address_params[:cellphone_number] 
    @address = Address.new(
      cellphone_number: address_params[:cellphone_number],
      # validateエラーに反応してしまうので、スルーするために情報を入力しておく
      post_number: "476-0002",
      prefecture: "a",
      city: "0",
      address: "u",
    )
    render 'devise/registrations/confirm_phone' unless @address.valid?
    @address = Address.new
  end

  def create
    
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      family_name: session[:family_name],
      first_name: session[:first_name],
      family_name_kana: session[:family_name_kana],
      first_name_kana: session[:first_name_kana],
      birthday_year: session[:birthday_year],
      birthday_month: session[:birthday_month],
      birthday: session[:birthday],
      cellphone_number: session[:cellphone_number]

      )
    @user.save
    session[:post_number] = address_params[:post_number]
    session[:prefecture] = address_params[:prefecture]
    session[:city] = address_params[:city]
    session[:address] = address_params[:address]
    session[:building_name] = address_params[:building_name]
    session[:phone_number] = address_params[:phone_number]
    @address = Address.create(
      # セッションに入れた内容を取り出す記述
      # ユーザーカラムに@userも情報を入れる。addressにuser_idが必要なため
      user: @user,
      cellphone_number: session[:cellphone_number],
      post_number: session[:post_number],
      prefecture: session[:prefecture],
      city: session[:city],
      address: session[:address],
      building_name: session[:building_name]
    )
    
    unless @address.valid?
      render 'devise/registrations/new_address' 
    end
    
    sign_in @user unless user_signed_in?


    redirect_to root_path

  end

  def compleated
  end

  private

  def user_params
    params.require(:user).permit( :nickname, 
                                  :family_name,
                                  :first_name, 
                                  :family_name_kana, 
                                  :first_name_kana, 
                                  :cellphone_number, 
                                  :email,
                                  :password, 
                                  :password_confirmation, 
                                  :profile, 
                                  :image, 
                                  :birthday, 
                                  :birthday_month, 
                                  :birthday_year, 
                                  
                                )
    end
    
    def address_params
      params.require(:address).permit(:post_number, 
                                      :city, 
                                      :address, 
                                      :building_name, 
                                      :prefecture,
                                      :cellphone_number,
                                      )
    end
end
