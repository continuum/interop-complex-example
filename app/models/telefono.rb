class Telefono < ApplicationRecord
  belongs_to :persona, inverse_of: :telefonos

end
