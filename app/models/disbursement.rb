class Disbursement < ApplicationRecord
  belongs_to :order

  validates :amount, presence: true
  
  class << self
    def disburse_to_merchant(id, amount)
      create(order_id: id, amount: self.disburse_amount(amount))
    end

    def disburse_amount(amount)
      amount - (amount * percentage(amount))
    end

    def percentage(amount)
      disbursement_range.each do |value| 
        return value["percentage"] if amount.between?(value["minimum"], value["maximium"])
      end
      # if amount.between?(50, 300)
      #   0.0095
      # elsif amount > 300
      #   0.0085
      # else
      #   0.01
      # end
    end
  end


  def disbursement_range 
    [
      {
        "precentage": 0.01,
        "minimum": 0,
        "maximum": 50
      },
       {
        "precentage": 0.0095,
        "minimum": 50,
        "maximum": 300
       },
       {
        "precentage": 0.0085,
        "minimum": 301,
        "maximum": nil
       }
    ]
  end

  ## get the disbursement to a merchant when the merchant_id
  ## is provided and chain with per_week scope to return the 
  ## disbursement
  scope :for_merchant_per_week, -> (merchant_id) do
    joins(:order).where('orders.merchant_id = ?', merchant_id).per_week
  end

  ## return all disbursement for that particular week
  scope :per_week, -> do
    where('disbursements.created_at BETWEEN :start_date AND :end_date',
      {
        start_date: Time.zone.now.beginning_of_week,
        end_date: Time.zone.now.end_of_week
      }
    )
  end
end
