FactoryBot.define do
  factory :order do
    amount { 1.5 }
    completed_at { nil }
    shopper
    merchant
  end
end
