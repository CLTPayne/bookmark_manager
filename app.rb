# model
require 'sinatra/base'
require 'sinatra/flash'
require './lib/bookmark'
require 'uri'

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
    flash[:error_message] = "Error this is not a valid URL" unless Bookmark.create(url: params['url'], title: params['title'])
    redirect '/bookmarks'
  end

  run! if app_file == $0

end
