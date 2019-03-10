require 'rails_helper'

describe "user sees one article" do
  describe "on the individual show page" do
    it "shows info about that article" do
      article_1 = Article.create!(title: "Test article", body: "Article for testing")

      visit articles_path

      click_link article_1.title

      expect(page).to have_content(article_1.title)
      expect(page).to have_content(article_1.body)
    end
  end
end
