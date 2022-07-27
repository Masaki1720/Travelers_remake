class CreateDestinations < ActiveRecord::Migration[6.1]
  def change
    create_table :destinations do |t|
      t.string "spot_name"
      t.text "spot_introduction"
      t.integer "destination_area", default: 0, null: false
      t.string "city"
      t.string "transportation"
      t.text "route"
      t.string "hotel"
      t.string "exchange"
      t.text "other_info"
      t.integer "prefecture"
      t.timestamps
    end
  end
end
