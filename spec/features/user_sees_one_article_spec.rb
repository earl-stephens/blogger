require 'rails_helper'

describe "user sees one article" do
  describe "on the individual show page" do
    it "shows info about that article" do
      article_1 = Article.create!(title: "Test article", body: "Article for testing")
      comment_1 = article_1.comments.create(author_name: "Me", body: "Commenty comments")
      comment_2 = article_1.comments.create(author_name: "You", body: "So much to say")

      visit articles_path

      click_link article_1.title

      expect(page).to have_content(article_1.title)
      expect(page).to have_content(article_1.body)
      expect(page).to have_content(comment_1.author_name)
      expect(page).to have_content(comment_1.body)
      expect(page).to have_content(comment_2.author_name)
      expect(page).to have_content(comment_2.body)

    end

    it "can delete an article" do
      article_1 = Article.create!(title: "Test article", body: "Article for testing")
      article_2 = Article.create!(title: "Second Test", body: "Article for second article testing")

      visit article_path(article_1)

      click_on "Delete"

      expect(current_path).to eq(articles_path)
      expect(page).to have_content("The article has been deleted.")
      expect(page).to_not have_content(article_1.title)
      # expect(page).to_not have_content("Article for testing")
      expect(page).to have_content(article_2.title)
      # expect(page).to have_content("Article for second article testing")
    end
  end
end
