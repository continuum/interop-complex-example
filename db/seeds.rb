# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



persons = [
  {
    nombres: "Juan Andres",
    apellidos: "Perez Cortez",
    email: "juan@dominio.com"
  },
  {
    nombres: "Andres de Jesus",
    apellidos: "Bello López",
    email: "andres@dominio.com"
  },
  {
    nombres: "Pedro Jose",
    apellidos: "Gonzalez Alvarado",
    email: "pedro@dominio.com"
  },
  {
    nombres: "Jose Luis",
    apellidos: "Rodriguez Carrera"
  }
]

first_phones = [
  {numero: 1111111},
  {numero: 2222222},
]

second_phones = [
  {numero: 3333333},
  {numero: 4444444}
]

Persona.create(persons)

first = Persona.first.telefonos.create(first_phones)
second = Persona.second.telefonos.create(second_phones)
