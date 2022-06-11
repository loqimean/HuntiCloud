class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:public_page]
  before_action :set_theme_by_default

  def public_page; end # add route for this

  private

  def set_theme_by_default
    cookies[:dark_theme] ||= 'true'
  end
end
