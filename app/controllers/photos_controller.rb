class PhotosController < ApplicationController
 
  def photo_list
    matching_photos = Photo.all

    @list_of_photos = matching_photos.order({ :created_at => :desc})

    render({ :template => "photos_templates/all_photos" })
  end

  def image
    # Parameters: {"single_image"=>"777"}

    url_id = params.fetch("single_image")

    matching_photos = Photo.where({ :id => url_id})

    @the_photo = matching_photos.at(0)

    render({ :template => "photos_templates/one_image"})
  end

  def baii
    the_id = params.fetch("path_id")

    matching_photos=Photo.where({ :id => the_id })

    the_photo = matching_photos.at(0)

    the_photo.destroy

    #render({ :template => "photos_templates/baii.html.erb"})

    redirect_to("/photos")
  end

  def create

    #Parameters: {"query_image"=>"a", "query_caption"=>"b", "query_owner_id"=>"c"}

    input_image = params.fetch("query_image")

    input_caption = params.fetch("query_caption")

    input_owner_id = params.fetch("query_owner_id")

    a_new_photo = Photo.new

    a_new_photo.image = input_image
    a_new_photo.caption = input_caption
    a_new_photo.owner_id = input_owner_id

    a_new_photo.save

    #render({ :template => "photos_templates/create.html.erb"})

    redirect_to("/photos/" + a_new_photo.id.to_s)
  end

  def update
    
    the_id = params.fetch("modify_id")

    matching_photos = Photo.where({ :id => the_id})

    the_photo = matching_photos.at(0)

    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")

    the_photo.image= input_image
    the_photo.caption= input_caption

    the_photo.save

    redirect_to("/photos/" + the_photo.id.to_s)
      
  end

  def update_comment
    
    #Parameters: {"input_photo_id"=>"777", "input_author_id"=>"117", "input_body"=>"hi", "update_comment"=>"777"}
    
    photo_id = params.fetch("input_photo_id")

    author_id = params.fetch("input_author_id")

    comment = params.fetch("input_body")

    a_new_comment = Comment.new

    a_new_comment.photo_id = photo_id
    a_new_comment.author_id = author_id
    a_new_comment.body = comment

    a_new_comment.save

    redirect_to("/photos/" + photo_id.to_s)
  end
end