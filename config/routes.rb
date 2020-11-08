Rails.application.routes.draw do

get("/users", { :controller => "users", :action => "user_list"})

get("/", { :controller => "users", :action => "user_list"})

get("/users/:username", { :controller => "users", :action => "person"})

get("/update_user/:user_id", { :controller => "users", :action => "update"})

get("/insert_user_record", { :controller => "users", :action => "create"})

get("/photos", { :controller => "photos", :action => "photo_list"})

get("/photos/:single_image", { :controller => "photos", :action => "image"})

get("/delete_photo/:path_id", { :controller => "photos", :action => "baii"})

get("/insert_photo", { :controller => "photos", :action => "create"})

get("/update_photo/:modify_id", { :controller => "photos", :action => "update"})

get("/insert_comment_record/:update_comment", { :controller => "photos", :action => "update_comment"})

end
