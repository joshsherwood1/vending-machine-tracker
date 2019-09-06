require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
    it {should have_many :machine_snacks}
    it {should have_many(:snacks).through(:machine_snacks)}
  end

  describe "instance methods" do
    it "average snack price for machine" do
      sam = Owner.create(name: "Sam's Snacks")
      basement = sam.machines.create(location: "Turing Basement")
      snack_1 = basement.snacks.create(name: "Cheetos", price: 1.50)
      snack_2 = basement.snacks.create(name: "Chocolate", price: 2.50)

      expect(basement.average_snack_price).to eq(2.00)
    end

    it "total snack count for machine" do
      sam = Owner.create(name: "Sam's Snacks")
      basement = sam.machines.create(location: "Turing Basement")
      snack_1 = basement.snacks.create(name: "Cheetos", price: 1.50)
      snack_2 = basement.snacks.create(name: "Chocolate", price: 2.50)

      expect(basement.total_snack_count).to eq(2)
    end
  end
end
