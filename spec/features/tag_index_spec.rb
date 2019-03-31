require 'rails_helper'

describe "tag index page" do
  it "shows all tags" do
    article = Article.create(title: "New Title", body: "New Body")
    tag = article.tags.create(name: "Name")
    tag2 = article.tags.create(name: "Name2")
    tag3 = article.tags.create(name: "Name3")

    visit tags_path

    expect(page).to have_content(tag.name)
    expect(page).to have_content(tag2.name)
    expect(page).to have_content(tag3.name)
  end
end
