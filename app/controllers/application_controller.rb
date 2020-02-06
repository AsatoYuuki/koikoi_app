class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :family_name, :first_name, :family_name_kana, :first_name_kana, :cellphone_number, :profile, :image, :birthday_month, :birthday_year, :birthday, :post_numner, :prefecture, :city, :address, :building_name, :phone_number])
  end
end
