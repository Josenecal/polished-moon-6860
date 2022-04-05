require 'rails_helper'

RSpec.describe "Manufacturers Index" do

  it "Shows a list of all manufacturers with a sublist of their items" do
    project = Project.create!(name: "Food Sales", manager: "Bill")
    manufacturer_1 = Manufacturer.create!(name: "La Colombe", location: "Philladelphia, PA")
    manufacturer_2 = Manufacturer.create!(name: "Lovin Oven", location: "Boulder, CO")
    item_1 = project.items.create!(name: "Monaco, 12oz", cost: 8)
    item_2 = project.items.create!(name: "House Blend, 12oz", cost: 8)
    item_3 = project.items.create!(name: "Gluten Free Blueberry Muffin", cost: 4)
    join_1 = ManufacturerItem.create!(item_id: item_1.id, manufacturer_id: manufacturer_1.id)
    join_2 = ManufacturerItem.create!(item_id: item_2.id, manufacturer_id: manufacturer_1.id)
    join_3 = ManufacturerItem.create!(item_id: item_3.id, manufacturer_id: manufacturer_2.id)

    visit "/manufacturers/"

    expect(page).to have_content(manufacturer_1.name)
    expect(page).to have_content(manufacturer_2.name)

    # Within blocks to ensure product is associated to manufacturer
    within("#manufacturer_section_#{manufacturer_1.id}") do
      expect(page).to have_content(item_1.name)
      expect(page).to have_content(item_2.name)
    end
    within("#manufacturer_section_#{manufacturer_2.id}") do
      expect(page).to have_content(item_3.name)
    end
  end

end
