require 'rails_helper'

describe "tag delete page" do
  it "can delete a tag" do
    article = Article.create(title: "New Title", body: "New Body")
    tag = article.tags.create(name: "Name")
    tag2 = article.tags.create(name: "Name2")
    tag3 = article.tags.create(name: "Name3")
# binding.pry
    visit tags_path

    within ".delete#{tag2.id}" do
      click_link "Delete"
    end

    expect(page).to have_content(tag.name)
    expect(page).to_not have_content(tag2.name)
    expect(page).to have_content(tag3.name)
  end
end
