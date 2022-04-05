require 'rails_helper'

RSpec.describe "Item Show" do

  it "displays that item's name and cost" do
    project = Project.create!(name: "WebApp Development", manager: "Bill")
    item = Item.create!(name: "G2 Pen, extra fine, black", cost: 12, project_id: project.id)
    visit "/items/#{item.id}"

    expect(page).to have_content(item.cost)
    expect(page).to have_content(item.name)
  end
end
