FactoryBot.define do
  factory :admin_offer, class: 'Admin::Offer' do
    advertiser_name { 'Advertiser' }
    description     { 'Toys for sale' }
    url             { 'http::\\lemmony.com' }
    start_at        { Time.current }
    ends_at         { Time.current + 1.day }

    trait :premium do
      premium { true }
    end

    trait :enabled do
      status { :enabled }
    end

    trait :disabled do
      status { :disabled }
    end
  end
end
