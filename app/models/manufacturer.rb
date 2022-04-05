class Manufacturer < ApplicationRecord
  validates_presence_of :name, :location
  has_many :manufacturer_items
  has_many :items, through: :manufacturer_items

  def self.map_items # WOW this is a heavy method
    products = {}
    all.each do |manufacturer|
      products[manufacturer] = manufacturer.items
    end
    products
  end
end
