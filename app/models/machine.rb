class Machine < ApplicationRecord
  validates_presence_of :location
  has_many :machine_snacks
  has_many :snacks, through: :machine_snacks
  belongs_to :owner

  def average_snack_price
    self.snacks.average(:price)
  end

  def total_snack_count
    self.snacks.count
  end
end
