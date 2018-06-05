require 'bookmark'

describe Bookmark do
  describe '#all' do
    it 'returns all bookmarks in an array' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.ft.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('https://www.economist.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('https://www.dailymail.co.uk');")

      expected_bookmarks = [
        'https://www.ft.com',
        'https://www.economist.com',
        'https://www.dailymail.co.uk'
      ]

      expect(Bookmark.all).to eq expected_bookmarks
    end
  end 
end