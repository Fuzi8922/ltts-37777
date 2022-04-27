FactoryBot.define do
  factory :review do
    item                  { 'test-item123あかさ' }
    review_text           { 'test-review-text123あかさ' }
    price_range_id        { 3 }
    category_id           { 3 }
    evaluation_id         { 3 }
    association :user

    after(:build) do |review|
      review.image.attach(io: File.open('app/assets/images/BW_Cancels.jpeg'), filename: 'BW.Cancels.jpeg')
    end
  end
end
