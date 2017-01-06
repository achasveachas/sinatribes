class UsersController < ApplicationController

  configure do
    set :views, "app/views/users"
    erb :layout, :"../layout"
  end

  get "/signup" do
    redirect to("/user/#{current_user.username}") if logged_in?
    erb :signup
  end

  post "/signup" do

  end

  get "/login" do
    redirect to("/user/#{current_user.username}") if logged_in?
    erb :login
  end

  post "/login" do

  end

  get /\A\/.+/, logged_in: false do
    redirect to("/login")
  end

  get "/" do
    erb :index
  end

end
