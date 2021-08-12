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

 # in app.rb

  get '/bookmarks' do
    p @bookmarks = Bookmark.all
    erb :"/bookmarks/index" 
  end
  
  get '/bookmarks/new' do
    erb :"/bookmarks/new"
  end
  
  post '/bookmarks' do
    # p params
    # p "form data submitted"
    p url = params['url']
    p connection = PG.connect(dbname: 'bookmark_manager_test')
   p  connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
   redirect '/bookmarks'
  end
  
  
  
  run! if app_file == $0
end
