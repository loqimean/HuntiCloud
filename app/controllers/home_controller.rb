class HomeController < ApplicationController
  def index
    @total_galleries = Gallery.ordered.count
  end
end
