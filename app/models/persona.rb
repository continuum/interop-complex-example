class Persona < ApplicationRecord
  has_many :telefonos, inverse_of: :persona
  accepts_nested_attributes_for :telefonos

  validates :nombres, :apellidos, presence: true

  def as_json(options={})
    {
        persona: {
          id: id,
          nombres: nombres,
          apellidos: apellidos
        },
        datos: {
          telefonos: telefonos.map{|tel| tel.numero},
          email: email
        }
    }
  end

end
