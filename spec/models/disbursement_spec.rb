require 'rails_helper'

RSpec.describe Disbursement, type: :model do
  describe 'association' do
    it { should belong_to(:order) }
  end

  describe 'validation' do
    it { should validate_presence_of(:amount) }
  end
end
