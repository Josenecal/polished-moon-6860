require 'rails_helper'

RSpec.describe "Item Show" do

  it "displays that item's name and cost" do
    project = Project.create!(name: "WebApp Development", manager: "Bill")
    item = Item.create!(name: "G2 Pen, extra fine, black", cost: 12, project_id: project.id)
    visit "/items/#{item.id}"

    expect(page).to have_content(item.cost)
    expect(page).to have_content(item.name)
  end

  it "displays a count of the manufacturers who make this item" do
    project = Project.create!(name: "Food Sales", manager: "Bill")
    manufacturer_1 = Manufacturer.create!(name: "La Colombe", location: "Philladelphia, PA")
    manufacturer_2 = Manufacturer.create!(name: "Lovin Oven", location: "Boulder, CO")
    manufacturer_3 = Manufacturer.create!(name: "Bake House", location: "Aurora, CO")
    item_2 = project.items.create!(name: "House Blend, 12oz", cost: 8)
    item_3 = project.items.create!(name: "Gluten Free Blueberry Muffin", cost: 4)
    join_2 = ManufacturerItem.create!(item_id: item_2.id, manufacturer_id: manufacturer_1.id)
    join_3 = ManufacturerItem.create!(item_id: item_3.id, manufacturer_id: manufacturer_2.id)
    join_4 = ManufacturerItem.create!(item_id: item_3.id, manufacturer_id: manufacturer_3.id)

    visit "/items/#{item_2.id}"

    expect(page).to have_content("Manufacturers: 1")

    visit "/items/#{item_3.id}"

    expect(page).to have_content("Manufacturers: 2")
  end
end
