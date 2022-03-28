class Order < ApplicationRecord
  belongs_to :shopper
  belongs_to :merchant

  has_many :disbursements
end
