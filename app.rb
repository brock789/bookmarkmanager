# in app.rb

require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'

class BookMarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    "Bookmark Manager"
  end

  get '/bookmarks' do
    # Print the ENV variable
    p ENV
    @bookmarks = Bookmark.all
    erb :index
  end
  
  
  run! if app_file == $0
end
