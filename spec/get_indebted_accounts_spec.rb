feature "Can get indebted accounts" do
  scenario "Account holder can acees a list of acconts in debt" do
    visit('/')
    click_button('Get accounts')
    fill_in :guid, with: "a4a06bb0-3fbe-40bd-9db2-f68354ba742f"
    click_button('Get indebted accounts')
    expect(page).to have_content "The following Account ID's are in debt:"
  end
end
