feature 'Can check balance' do
  scenario 'User can check their balance with a User ID' do
    visit('/')
    click_button "Check Balance"
    fill_in :id, with: "21dc2de5-309c-41e9-aba0-0375771eb046"
    click_button "Check balance"
    expect(page).to have_content "Your balance is: -1,708.15"
  end
end
