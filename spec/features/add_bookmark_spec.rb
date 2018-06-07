require 'pg'

feature 'Adding bookmark' do
    scenario 'user can add a valid bookmark with title' do
        visit('/bookmarks/add')
        fill_in('url', with: 'https://www.matthewwareing.com')
        fill_in('title', with: 'The Matthew Show')
        click_button('Add')
        expect(page).to have_content("The Matthew Show")
    end

    scenario 'user sees an error when adding an invalid bookmark' do
        visit('/bookmarks/add')
        fill_in('url', with: 'Not a real bookmark')
        fill_in('title', with: 'The Matthew Show')
        click_button('Add')
        expect(page).not_to have_content('Not a real bookmark')
        expect(page).to have_content("Error this is not a valid URL")
    end

end
