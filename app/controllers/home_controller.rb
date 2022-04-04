class HomeController < ApplicationController
  def index
    @total_galleries = Gallery.ordered.count
    @monobank_service = Monobank::Base.new
  end
end
