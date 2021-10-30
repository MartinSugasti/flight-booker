class SettingsController < ApplicationController
  def change_locale
    locale = set_locale
    cookies.permanent[:locale] = locale
    redirect_to request.referer || root_url
  end

  private

  def set_locale
    return params[:locale].to_sym if I18n.available_locales.include?(params[:locale]&.to_sym)

    I18n.default_locale
  end
end
