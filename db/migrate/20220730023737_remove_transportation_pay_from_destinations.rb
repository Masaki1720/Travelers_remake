class RemoveTransportationPayFromDestinations < ActiveRecord::Migration[6.1]
  def change
    remove_column :destinations, :checkbox, :boolean
    remove_column :destinations, :transportation_pay, :text
  end
end
