class AddTransportationPaysToDestinations < ActiveRecord::Migration[6.1]
  def change
    add_column :destinations, :checkbox, :boolean
    add_column :destinations, :transportation_pays, :text
  end
end
