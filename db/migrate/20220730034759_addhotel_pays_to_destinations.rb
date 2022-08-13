class AddhotelPaysToDestinations < ActiveRecord::Migration[6.1]
  def change
    add_column :destinations, :hotel_pays, :text
  end
end
