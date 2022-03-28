require 'rails_helper'

RSpec.describe MerchantDisbursementsJob, type: :job do
  let(:job) { described_class.new }
  let(:merchant) { create :merchant  }
  let(:shopper) { create :shopper  }
  let(:completed_at) { nil }
  let(:order) { create :order, completed_at: completed_at, shopper: shopper, merchant: merchant }

  describe "#perform" do
    before do
      order
      allow(MerchantDisbursementJob).to receive(:perform_later)
    end

    context "when there's no completed order " do
      it "does not enqueue any MerchantDisbursementJob" do
        job.perform

        expect(MerchantDisbursementJob).not_to have_received(:perform_later)
      end
    end

    context "when there's a completed order" do
      let(:completed_at) { Time.zone.today }

      it "enqueue a MerchantDisbursementJob" do
        job.perform

        expect(MerchantDisbursementJob).to have_received(:perform_later).with(order.id, order.amount)
      end
    end
  end
end
