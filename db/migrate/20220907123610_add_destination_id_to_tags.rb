class AddDestinationIdToTags < ActiveRecord::Migration[6.1]
  def change
    add_column :tags, :destination_id, :integer
  end
end
