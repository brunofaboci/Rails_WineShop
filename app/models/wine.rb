class Wine < ApplicationRecord
  belongs_to :type
  belongs_to :grape_type
  belongs_to :country
  belongs_to :admin

end
