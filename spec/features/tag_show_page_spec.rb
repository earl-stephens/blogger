require 'rails_helper'

describe "tag show page" do
  it "shows the tag page" do
    article = Article.create(title: "New Title", body: "New Body")
    tag = article.tags.create(name: "Name")

    visit article_path(article)

    click_link "Name"

    expect(page).to have_content(tag.name)
  end
end
