FactoryBot.define do
  factory :order do
    amount { 1.5 }
    completed_at { "2022-03-28 20:52:23" }
    shopper { nil }
    merchant { nil }
  end
end
