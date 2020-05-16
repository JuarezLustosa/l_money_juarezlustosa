namespace :offers do
  desc 'Disable offers than time was passed'
  # Can be configured by cron and background job
  task disable_offers: :environment do
    Admin::Offer.enabled.map(&:touch)
  end
end
