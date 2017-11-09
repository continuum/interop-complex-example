class Persona < ApplicationRecord
  has_many :telefonos, inverse_of: :persona
  accepts_nested_attributes_for :telefonos

  validates :nombres, :apellidos, presence: true

  STATIC_PERSON_NAMES = ["Juan Andres", "Andres de Jesus", "Pedro Jose", "Jose Luis"]

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
