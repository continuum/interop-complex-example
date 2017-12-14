# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



persons = [
  {
    nombres: Persona::STATIC_PERSON_NAMES[0],
    apellidos: "Perez Cortez",
    email: "juan@dominio.com"
  },
  {
    nombres: Persona::STATIC_PERSON_NAMES[1],
    apellidos: "Bello López",
    email: "andres@dominio.com"
  },
  {
    nombres: Persona::STATIC_PERSON_NAMES[2],
    apellidos: "Gonzalez Alvarado",
    email: "pedro@dominio.com"
  },
  {
    nombres: Persona::STATIC_PERSON_NAMES[3],
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
TraceInfo.create!([
  {time: "2017-12-12 17:22:06", remote_host_ip: "127.0.0.1", interop_service_requested: "localhost", http_method: "GET", url: "http://localhost:3000/complex_example/monitor", response_http_code: "200", consumer_institution_code: "BB001", oid_identifier: "OIDOID"},
  {time: "2017-12-12 17:22:20", remote_host_ip: "127.0.0.1", interop_service_requested: "localhost", http_method: "GET", url: "http://localhost:3000/complex_example/monitor", response_http_code: "200", consumer_institution_code: "BB001", oid_identifier: "OIDOID"},
  {time: "2017-12-12 17:27:19", remote_host_ip: "127.0.0.1", interop_service_requested: "localhost", http_method: "GET", url: "http://localhost:3000/complex_example/monitor", response_http_code: "200", consumer_institution_code: "INFO NOT SENT", oid_identifier: "OIDOID"},
  {time: "2017-12-13 13:28:34", remote_host_ip: "127.0.0.1", interop_service_requested: "localhost", http_method: "GET", url: "http://localhost:3000/complex_example/monitor", response_http_code: "200", consumer_institution_code: "INFO NOT SENT", oid_identifier: "OIDOID"},
  {time: "2017-12-13 13:28:38", remote_host_ip: "127.0.0.1", interop_service_requested: "localhost", http_method: "GET", url: "http://localhost:3000/complex_example/monitor", response_http_code: "200", consumer_institution_code: "INFO NOT SENT", oid_identifier: "OIDOID"},
  {time: "2017-12-13 13:30:57", remote_host_ip: "127.0.0.1", interop_service_requested: "localhost", http_method: "GET", url: "http://localhost:3000/complex_example/personas", response_http_code: "200", consumer_institution_code: "INFO NOT SENT", oid_identifier: "OIDOID"},
  {time: "2017-12-13 13:31:05", remote_host_ip: "127.0.0.1", interop_service_requested: "localhost", http_method: "GET", url: "http://localhost:3000/complex_example/personas", response_http_code: "200", consumer_institution_code: "INFO NOT SENT", oid_identifier: "OIDOID"}
])
