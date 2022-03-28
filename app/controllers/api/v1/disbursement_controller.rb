module Api
  module V1
    class DisbursementController < ApplicationController
      def index
        disbursements = if merchant_id.present?
                          Disbursement.for_merchant_per_week(merchant_id)
                        else
                          Disbursement.per_week
                        end

        render json: disbursements, status: :ok
      end

      private

      def merchant_id
        params[:merchant_id]
      end
    end
  end
end
