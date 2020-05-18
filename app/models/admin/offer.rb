class Admin::Offer < ApplicationRecord
  validates :advertiser_name, :description, :start_at, presence: true
  validates :description, length: {  maximum: 500 }
  validates :url, format: URI::regexp(%w[http https])

  enum status: { enabled: 'enabled', disabled: 'disabled' }

  scope :premium_order, -> {
    order('(case when premium then 1 else 0 end) DESC, created_at DESC')
  }
end
