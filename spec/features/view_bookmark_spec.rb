require 'pg'

feature "viewing bookmarks" do
  scenario "user can see bookmarks" do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks VALUES(1,'https://www.ft.com');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'https://www.economist.com');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'https://www.dailymail.co.uk');")

    visit('/bookmarks')
    expect(page).to have_content "https://www.ft.com"
    expect(page).to have_content "https://www.economist.com"
    expect(page).to have_content "https://www.dailymail.co.uk"
  end
end
