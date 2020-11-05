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

    if @the_user == nil
      redirect_to("/404")
    else
    render ({ :template => "users_templates/one_user"})
    end
  end

end