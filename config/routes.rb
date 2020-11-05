Rails.application.routes.draw do

get("/users", { :controller => "users", :action => "user_list"})

get("/", { :controller => "users", :action => "user_list"})

get("/users/:username", { :controller => "users", :action => "person"})

get("/photos", { :controller => "photos", :action => "photo_list"})

get("/photos/:single_image", { :controller => "photos", :action => "image"})

end
