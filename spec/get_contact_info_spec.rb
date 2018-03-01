feature 'Can get contact info' do
  scenario 'Customer can get contanct info of an account holder' do
    visit('/')
    click_button "Find Contact"
    fill_in :id, with: "21dc2de5-309c-41e9-aba0-0375771eb046"
    click_button "Get Contact Information"
    expect(page).to have_content "First Name: Jimmy"
    expect(page).to have_content "Last Name: Irwin"
    expect(page).to have_content "Email: Jimm.IRW8123@yopmail.com"
    expect(page).to have_content "Phone Number: 01526 827793"
    expect(page).to have_content "Balance: -1,708.15"
  end
end
