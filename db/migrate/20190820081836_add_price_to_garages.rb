class AddPriceToGarages < ActiveRecord::Migration[5.2]
  def change
    add_monetize :garages, :price_regular_bike, currency: { present: false }
    add_monetize :garages, :price_large_bike, currency: { present: false }
  end
end
