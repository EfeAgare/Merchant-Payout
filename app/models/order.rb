class Order < ApplicationRecord
  belongs_to :shopper
  belongs_to :merchant

  has_many :disbursements

  scope :completed, -> { where.not(completed_at: nil) }
end
