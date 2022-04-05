class Project < ApplicationRecord
  validates_presence_of :name, :manager
  has_many :items

  def average_cost
    count = items.length.to_f
    sum = items.sum {|item| item.cost}.to_f
    average = (sum / count).round(2)
  end
end
