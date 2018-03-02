feature 'Can get ID using names' do
  scenario 'Customer can get account ID using only firstname' do
    visit('/')
    click_button "Find ID"
    fill_in :firstname, with: "Jimmy"
    click_button "Get ID"
    expect(page).to have_content "21dc2de5-309c-41e9-aba0-0375771eb046"
  end
  scenario 'Customer can get account ID using only lastname' do
    visit('/')
    click_button "Find ID"
    fill_in :lastname, with: "Irwin"
    click_button "Get ID"
    expect(page).to have_content "21dc2de5-309c-41e9-aba0-0375771eb046"
  end
  scenario 'Customer can get account ID using both names' do
    visit('/')
    click_button "Find ID"
    fill_in :firstname, with: "Jimmy"
    fill_in :lastname, with: "Irwin"
    click_button "Get ID"
    expect(page).to have_content "21dc2de5-309c-41e9-aba0-0375771eb046"
  end
end
