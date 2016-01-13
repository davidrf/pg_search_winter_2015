require "rails_helper"

feature "user creates article" do
  let(:article) { build(:article) }
  scenario "user correctly fills out form" do
    visit root_path

    within ".new_article" do
      fill_in "Title", with: article.title
      fill_in "Body", with: article.body
      click_button "Create Article"
    end

    expect(page).to have_content("Article saved!")
    expect(page).to have_content article.title
    expect(page).to have_content article.body
  end

  scenario "user incorrectly fills out form" do
    visit root_path

    within ".new_article" do
      click_button "Create Article"
    end

    expect(page).to have_content("Article not saved!")
  end
end
