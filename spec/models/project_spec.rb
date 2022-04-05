require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :manager }
  end

  describe 'relationships' do
    it { should have_many :items }
  end

  describe 'instance methods' do

    it '#average_cost' do
      project = Project.create!(name: "Bedding", manager: "Allon")
      item_1 = project.items.create!(name: "standard pillow", cost: 3)
      item_2 = project.items.create!(name: "throw pillow", cost: 2)
      item_3 = project.items.create!(name: "twin sheets", cost: 4)
      item_4 = project.items.create!(name:  "standard pillowcase", cost: 1)

      expect(project.average_cost).to eq(2.50)
    end
  end
end
