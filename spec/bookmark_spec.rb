require 'bookmark'

describe Bookmark do

  describe '#all' do
    it 'returns all bookmarks in an array' do

      Bookmark.create(url: "https://www.ft.com")
      Bookmark.create(url: "https://www.economist.com")
      Bookmark.create(url: "https://www.dailymail.co.uk")
      expected_bookmarks = [
        'https://www.ft.com',
        'https://www.economist.com',
        'https://www.dailymail.co.uk'
      ]
      expect(Bookmark.all).to eq expected_bookmarks
    end
  end

  describe '#create' do
    it 'creates a new bookmark if valid URL' do
      Bookmark.create(url: 'http://www.testbookmark.com')
      expect(Bookmark.all).to include 'http://www.testbookmark.com'
    end

    it 'returns an error message if not a valid URL' do
      error_message = "Error this is not a valid URL"
      expect(Bookmark.create(url: 'testbookmarkcom')).to eq error_message
    end
  end
end
