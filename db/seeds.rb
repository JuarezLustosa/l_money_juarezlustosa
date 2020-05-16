# Atention this is a fake infos. Only for test on development envirioment
require 'faker'

if Rails.env.development?
  ## Enabled premium
  2.times.each do
    Admin::Offer.create(
      advertiser_name: "Advertiser premium #{rand(1..1000)}",
      description:     Faker::Lorem.paragraph(sentence_count: 2),
      url:             Faker::Internet.url(host: 'lemmoney.com'),
      start_at:        Time.current,
      ends_at:         Time.current + 5.day,
      premium:         true,
      status:          :enabled
    )
  end
  ## Enabled non premium
  5.times.each do
    Admin::Offer.create(
      advertiser_name: "Advertiser #{rand(1..1000)}",
      description:     Faker::Lorem.paragraph(sentence_count: 2),
      url:             Faker::Internet.url(host: 'lemmoney.com'),
      start_at:        Time.current,
      ends_at:         Time.current + 3.day,
      premium:         false,
      status:          :enabled
    )
  end
  ## Disabled
  3.times.each do
    Admin::Offer.create(
      advertiser_name: "Advertiser disabled #{rand(1..1000)}",
      description:     Faker::Lorem.paragraph(sentence_count: 2),
      url:             Faker::Internet.url(host: 'lemmoney.com'),
      premium:         false,
      status:          :disabled
    )
  end
end
