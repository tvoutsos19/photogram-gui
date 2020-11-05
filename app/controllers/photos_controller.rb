class PhotosController < ApplicationController
 
  def photo_list
    render({ :template => "photos_templates/all_photos" })
  end

  def image
    render({ :template => "photos_templates/one_image"})
  end

end