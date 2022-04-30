class HomeController < ApplicationController
  def index
    @total_galleries = Gallery.ordered.count
    @monobank_service = MonobankService::Base.new
  end
end
