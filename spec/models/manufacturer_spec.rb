require 'rails_helper'

RSpec.describe Manufacturer, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :location }
  end

  describe 'relationships' do
    it { should have_many :manufacturer_items }
    it { should have_many(:items).through(:manufacturer_items) }
  end

  describe 'class methods' do
    it "::map_items returns a hash, all manufacturers as keys mapped to associations of their items" do
      project = Project.create!(name: "Food Sales", manager: "Bill")
      manufacturer_1 = Manufacturer.create!(name: "La Colombe", location: "Philladelphia, PA")
      manufacturer_2 = Manufacturer.create!(name: "Lovin Oven", location: "Boulder, CO")
      item_1 = project.items.create!(name: "Monaco, 12oz", cost: 8)
      item_2 = project.items.create!(name: "House Blend, 12oz", cost: 8)
      item_3 = project.items.create!(name: "Gluten Free Blueberry Muffin", cost: 4)
      join_1 = ManufacturerItem.create!(item_id: item_1.id, manufacturer_id: manufacturer_1.id)
      join_2 = ManufacturerItem.create!(item_id: item_2.id, manufacturer_id: manufacturer_1.id)
      join_3 = ManufacturerItem.create!(item_id: item_3.id, manufacturer_id: manufacturer_2.id)

      expected = Manufacturer.map_items
# binding.pry
      expect(expected).to eq({
        manufacturer_1 => manufacturer_1.items,
        manufacturer_2 => manufacturer_2.items
      })
    end
  end

end
