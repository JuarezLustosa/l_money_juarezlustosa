class CreateAdminOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :admin_offers do |t|
      t.string :advertiser_name, null: false
      t.string :url, null: false
      t.text :description, null: false, limit: 500
      t.date :start_at, null: false
      t.date :ends_at
      t.boolean :premium
      t.string :status, default: 'disabled'

      t.timestamps
    end
  end
end
