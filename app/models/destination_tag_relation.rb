class DestinationTagRelation < ApplicationRecord
  belongs_to :destination
  belongs_to :tag
end
