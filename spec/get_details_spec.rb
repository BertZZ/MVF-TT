feature 'Can check balance' do
  scenario 'User can check their details' do
    visit('/')
    click_button "Check Details"
    fill_in :id, with: "21dc2de5-309c-41e9-aba0-0375771eb046"
    click_button "Check Details"
    expect(page).to have_content "First Name: Jimmy"
    expect(page).to have_content "Last Name: Irwin"
    expect(page).to have_content "Email: Jimm.IRW8123@yopmail.com"
    expect(page).to have_content "Phone Number: 01526 827793"
  end
end
