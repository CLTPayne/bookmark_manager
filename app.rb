# model
require 'sinatra/base'
require 'sinatra/flash'
require './lib/bookmark'
# require 'uri'

class BookmarkManager < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :index
  end

  get '/bookmarks/add' do
    erb :"bookmarks/add"
  end

  post '/bookmarks' do
    if params['url'] =~ /\A#{URI::regexp(['http', 'https'])}\z/
      Bookmark.create(url: params['url'])
    else
      flash[:error_message] = "Error this is not a valid URL"
    end
    redirect '/bookmarks'
  end

  run! if app_file == $0

end
