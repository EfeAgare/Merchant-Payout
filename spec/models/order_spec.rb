require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'association' do
    it { should belong_to(:merchant) }
    it { should belong_to(:shopper) }
    it { should have_many(:disbursements) }
  end

  describe '#completed' do
    let(:merchant) { create :merchant  }
    let(:shopper) { create :shopper  }
    let(:order) { create_list :order, 5, completed_at: nil, shopper: shopper, merchant: merchant }

    before do
      order.first.update(completed_at: Time.zone.today)
      order.last.update(completed_at: Time.zone.today)
    end

    it 'returns only the completed orders' do
      expect(Order.completed.length).to eq 2
    end
  end
end
