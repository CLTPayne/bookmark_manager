require 'pg'

feature 'Adding bookmark' do
    scenario 'user can add a bookmark' do
        # connection = PG.connect(dbname: 'bookmark_manager_test')
        
        visit('/bookmarks/add')
        fill_in('url', with: 'https://www.matthewwareing.com')
        click_button('Add')
        
        expect(page).to have_content("https://www.matthewwareing.com")
    end
end