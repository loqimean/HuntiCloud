class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:public_page]

  def public_page; end # add route for this
end
