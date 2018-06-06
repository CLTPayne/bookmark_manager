require 'pg'
require 'uri'

class Bookmark

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    result = connection.exec("SELECT * FROM bookmarks")
    result.map { |bookmark| bookmark['url'] }
  end

  def self.create(options)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    error_message = "Error this is not a valid URL"
      if options[:url] =~ /\A#{URI::regexp(['http', 'https'])}\z/
        connection.exec("INSERT INTO bookmarks (url) VALUES('#{options[:url]}')")
      else
        error_message
      end
  end

end
