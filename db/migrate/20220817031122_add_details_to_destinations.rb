class AddDetailsToDestinations < ActiveRecord::Migration[6.1]
  def change
    add_column :destinations, :lat, :float
    add_column :destinations, :lng, :float
  end
end
