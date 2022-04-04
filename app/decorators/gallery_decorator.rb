class GalleryDecorator
  def initialize(collection)
    @@gallery_collection = collection
  end

  def date_grouped_collection
    @@gallery_collection.group_by do |element|
      element.created_at.strftime("%a, %B %d, %Y")
    end
  end
end
