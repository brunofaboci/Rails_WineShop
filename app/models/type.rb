class Type < ApplicationRecord
  has_many :wines

  # kaminari paginator
  paginates_per 5
end
