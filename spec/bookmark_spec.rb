require 'bookmark'

describe Bookmark do

  describe '#all' do
    it 'returns all bookmarks in an array' do

      bookmark1 = Bookmark.create(url: "https://www.ft.com")
      bookmark2 = Bookmark.create(url: "https://www.economist.com")
      bookmark3 = Bookmark.create(url: "https://www.dailymail.co.uk")
      expected_bookmarks = [
        bookmark1,
        bookmark2,
        bookmark3
      ]
      expect(Bookmark.all).to eq expected_bookmarks
    end
  end

  describe '#create' do
    it 'creates a new bookmark if valid URL' do
      bookmark = Bookmark.create(url: 'http://www.testbookmark.com')
      expect(Bookmark.all).to include bookmark
    end

    describe '#==' do
      it 'two Bookmarks are equal if their IDs match' do
        bookmark_1 = Bookmark.new(1, 'http://testbookmark.com', 'Test Book')
        bookmark_2 = Bookmark.new(1, 'http://testbookmark.com', 'Test Book')
        expect(bookmark_1).to eq bookmark_2
      end
    end
  end
end
