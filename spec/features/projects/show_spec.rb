require 'rails_helper'

RSpec.describe "Projects Show" do

  # User stories ask for "average" cost, which is very ambiguous. We will assume
  # desired average is Mean unless corrected
  it "display's the average cost per item for the items of that project" do
    project = Project.create!(name: "Food Sales", manager: "Bill K")
    manufacturer_1 = Manufacturer.create!(name: "La Colombe", location: "Philladelphia, PA")
    manufacturer_2 = Manufacturer.create!(name: "Lovin Oven", location: "Boulder, CO")
    item_1 = project.items.create!(name: "Monaco, 12oz", cost: 8)
    item_2 = project.items.create!(name: "House Blend, 12oz", cost: 8)
    item_3 = project.items.create!(name: "Gluten Free Blueberry Muffin", cost: 4)
    join_1 = ManufacturerItem.create!(item_id: item_1.id, manufacturer_id: manufacturer_1.id)
    join_2 = ManufacturerItem.create!(item_id: item_2.id, manufacturer_id: manufacturer_1.id)
    join_3 = ManufacturerItem.create!(item_id: item_3.id, manufacturer_id: manufacturer_2.id)

    visit "/projects/#{project.id}"

    expect(page).to have_content("6.67")
  end

end
