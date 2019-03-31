require 'rails_helper'

describe "user sees one article" do
  describe "on the individual show page" do
    it "shows info about that article" do
      article_1 = Article.create!(title: "Test article", body: "Article for testing")
      comment_1 = article_1.comments.create(author_name: "Me", body: "Commenty comments")
      comment_2 = article_1.comments.create(author_name: "You", body: "So much to say")

      visit articles_path

      click_link article_1.title

      count = Comment.count

      expect(page).to have_content(article_1.title)
      expect(page).to have_content(article_1.body)
      expect(page).to have_content(comment_1.author_name)
      expect(page).to have_content(comment_1.body)
      expect(page).to have_content(comment_2.author_name)
      expect(page).to have_content(comment_2.body)
      expect(page).to have_content("Comments (#{count})")

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

  describe "they fill in the comment form" do
    it "displays the comment on the article show page" do
      article = Article.create!(title: "Newer Title", body: "Newer body")

      visit article_path(article)

      fill_in "comment[author_name]", with: "Me!"
      fill_in "comment[body]", with: "So many thoughts on this article."
      click_on "Submit"

      expect(current_path).to eq(article_path(article))
      expect(page).to have_content("Post a comment")
      expect(page).to have_content("Me!")
      expect(page).to have_content("So many thoughts on this article.")
    end
  end
end
