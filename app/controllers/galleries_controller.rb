class GalleriesController < ApplicationController
  before_action :find_gallery, only: %i[show update destroy]

  def index
    @gallery_decorator = GalleryDecorator.new(current_user.galleries.where(removed: false).order(created_at: :desc))
  end

  def show
    @gallery.increment!(:count_of_views, 1)
  end

  def new; end

  def create
    @gallery = current_user.galleries.create!(gallery_params)
    redirect_to galleries_path
  end

  def update
    if gallery_params[:removed].nil?
      @gallery.update(gallery_params)

      respond_to do |format|
        format.turbo_stream
      end
    else
      @gallery.update(gallery_params)

      respond_to do |format|
        format.turbo_stream { render :soft_delete }
      end
    end
  end

  def destroy
    @gallery.destroy

    respond_to do |format|
      format.turbo_stream
    end
  end

  def favorites
    @galleries = current_user.galleries.where(favorite: true).order(created_at: :desc)
  end

  private

  def gallery_params
    params.require(:gallery).permit(:file, :removed, :favorite, :share)
  end

  def find_gallery
    @gallery = Gallery.find(params[:id])
  end
end
