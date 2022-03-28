require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'association' do
    it { should belong_to(:merchant) }
    it { should belong_to(:shopper) }
    it { should have_many(:disbursements) }
  end
end
