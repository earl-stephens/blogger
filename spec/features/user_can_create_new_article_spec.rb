require 'rails_helper'

describe "user can click on new article link" do
  describe "from the index page" do
    it "shows an input form" do
      article_1 = Article.create(title: "First Article", body: "This is the first article")

      visit articles_path

      click_link "Create a New Article"

      expect(current_path).to eq(new_article_path)

      fill_in "article[title]", with: "New Title!"
      fill_in "article[body]", with: "New Body!"
      fill_in "article[tag_list]", with: "ruby, technology"

      click_on "Create Article"
      # save_and_open_page
      expect(page).to have_content("Article New Title! has been created.")
      expect(page).to have_content("ruby technology")
      expect(page).to have_content("New Title!")
      expect(page).to have_content("New Body!")
    end
  end
end
