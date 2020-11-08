class UsersController < ApplicationController

  def user_list
    matching_users=User.all
    @list_of_users = matching_users.order({ :username => :asc})
    render({ :template => "users_templates/all_users"})
  end

  def person
    url_username = params.fetch("username")

    matching_usernames = User.where({ :username => url_username})

    @the_user = matching_usernames.at(0)

    render ({ :template => "users_templates/one_user"})
  end

def create
    user = User.new
    user.username = params.fetch("query_username")
    user.save
    
    redirect_to("/users/#{user.username}")
  end

  def update
    user_id = params.fetch("user_id")
    matching_users = User.where({ :id => user_id })
    the_user = matching_users.at(0)
    
    the_user.username = params.fetch("query_username")
    the_user.save
    redirect_to("/users/#{the_user.username}")
  end

end