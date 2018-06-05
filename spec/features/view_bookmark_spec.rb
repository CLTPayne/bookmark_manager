require 'pg'

feature "viewing bookmarks" do
  scenario "user can see bookmarks" do

    Bookmark.create(url: "https://www.ft.com")
    Bookmark.create(url: "https://www.economist.com")
    Bookmark.create(url: "https://www.dailymail.co.uk")
    visit('/bookmarks')

    expect(page).to have_content "https://www.ft.com"
    expect(page).to have_content "https://www.economist.com"
    expect(page).to have_content "https://www.dailymail.co.uk"
  end
end
