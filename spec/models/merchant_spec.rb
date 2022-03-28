require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'association' do
    it {should have_many(:orders) }
  end
end
