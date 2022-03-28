require 'rails_helper'

RSpec.describe "Api::V1::Disbursements", type: :request do
  let(:merchant_1) { create :merchant  }
  let(:merchant_2) { create :merchant  }
  let(:shopper) { create :shopper  }
  let(:order_1) { create :order, completed_at: Time.zone.today, shopper: shopper, merchant: merchant_1 }
  let(:order_2) { create :order, completed_at: Time.zone.today, shopper: shopper, merchant: merchant_2 }
  let(:disbursement_list_1) { create_list :disbursement, 3, order: order_1 }
  let(:disbursement_list_2) { create_list :disbursement, 3, order: order_2 }

  describe "GET /index" do
    before do
      disbursement_list_1
      disbursement_list_2
    end

    it "returns http success" do
      get "/api/v1/disbursement/index"
      expect(response).to have_http_status(:success)
    end

    context 'when no merchant id is provided ' do
      it "returns all disbursement for that week" do
        get "/api/v1/disbursement/index"

        expect(JSON.parse(response.body).length).to eq Disbursement.count
      end
    end

    context 'when a merchant id is provided ' do
      it "returns all disbursement for that week for the merchant" do
        get "/api/v1/disbursement/index", params: { merchant_id: merchant_1.id }

        expect(JSON.parse(response.body).length).to eq Disbursement.for_merchant_per_week(merchant_1.id).length
      end
    end
  end
end
