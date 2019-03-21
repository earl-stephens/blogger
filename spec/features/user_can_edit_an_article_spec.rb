require 'rails_helper'

describe "user can edit an article" do
  describe "from the index page" do
    it "shows an edit link" do
      article_1 = Article.create(title: "First Article", body: "This is the first article")

      visit article_path(article_1)

      click_link "Edit"

      expect(current_path).to eq(edit_article_path(article_1))

      fill_in "article[title]", with: "Updated Title"
      fill_in "article[body]", with: "Updated Body"
# save_and_open_page
      click_on "Update Article"
      expect(page).to have_content("Article Updated Title was updated.")

      visit article_path(article_1)
# save_and_open_page
      expect(page).to have_content("Updated Title")
      expect(page).to have_content("Updated Body")

    end
  end
end
