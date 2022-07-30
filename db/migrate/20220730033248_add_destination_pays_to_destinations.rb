class AddDestinationPaysToDestinations < ActiveRecord::Migration[6.1]
  def change
    add_column :destinations, :destination_pays, :text
  end
end
