require 'pg'

feature "viewing bookmarks" do
  scenario "user can see bookmarks" do

    Bookmark.create(url: "https://www.ft.com", title: "The Financial Times")
    Bookmark.create(url: "https://www.economist.com", title: "The Economist")
    Bookmark.create(url: "https://www.dailymail.co.uk", title: "The Daily Mail")
    visit('/bookmarks')

    expect(page).to have_content "The Financial Times"
    expect(page).to have_content "The Economist"
    expect(page).to have_content "The Daily Mail"
  end
end
