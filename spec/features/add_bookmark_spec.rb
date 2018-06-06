require 'pg'

feature 'Adding bookmark' do
    scenario 'user can add a valid bookmark' do
        visit('/bookmarks/add')
        fill_in('url', with: 'https://www.matthewwareing.com')
        click_button('Add')
        expect(page).to have_content("https://www.matthewwareing.com")
    end

    scenario 'user sees an error when adding an invalid bookmark' do
        visit('/bookmarks/add')
        fill_in('url', with: 'Not a real bookmark')
        click_button('Add')
        expect(page).not_to have_content('Not a real bookmark')
        expect(page).to have_content("Error this is not a valid URL")
    end

end
