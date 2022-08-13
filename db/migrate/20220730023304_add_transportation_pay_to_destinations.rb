class AddTransportationPayToDestinations < ActiveRecord::Migration[6.1]
  def change
    add_column :destinations, :checkbox, :boolean
    add_column :destinations, :transportation_pay, :text
  end
end
