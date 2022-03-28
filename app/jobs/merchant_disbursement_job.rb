class MerchantDisbursementJob < ApplicationJob
  queue_as :default

  def perform(id, amount)
    Disbursement.disburse_to_merchant(id, amount)
  end
end
