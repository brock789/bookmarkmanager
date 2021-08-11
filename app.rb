# in app.rb

require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'

class BookMarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  # in app.rb

get '/bookmarks/new' do
    erb :"/bookmarks/new"
  end
  
  post '/bookmarks' do
    #Bookmark.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end
  
  
  
  
  run! if app_file == $0
end
