class TraceabilityController < ApplicationController
  def logs
   # debugger
    p "hello"
    '
    [2016-10-25T08:15:30-04:00] 20.30.40.50 apis.digital.gob.cl "GET /misc/instituciones/AD015" 200 "BB001 e0592e56-76c3-11e7-814c-0401beb96201"
    '

'
    Fecha y Hora según el estándar definido en el punto 2.
    ● IP del Host remoto
    ● Servicio de interoperabilidad consultado.
    ● Método HTTP y URI solicitada.
    ● Código HTTP de respuesta según lo establecido en el RFC 2616, sección 10:
    ○ 2XX​ es exitoso
    ○ 3XX​ es una redirección
    ○ 4XX​ es un error del cliente
    ○ 5XX​ es un error del servidor
    ● Código de la Institución consumidora de la información según el listado expuesto en el
    siguiente recurso:
    https://apis.digital.gob.cl/misc/instituciones/_search?size=900&pretty=true.
    ● Identificador de la transacción en formato OID. Para generar el identificador de cada
    transacción se debe consultar la Guía de Manejo de OIDs.
'

    generate_logfile("2017-12-12", "2018-02-02")
  end

  def generate_logfile(start_date, end_date)
    initial_date = Time.zone.parse(start_date).strftime("%Y-%m-%d")
    final_date = Time.zone.parse(end_date).strftime("%Y-%m-%d")
    records = TraceInfo.where("time >= ? AND time <= ?", initial_date, final_date)
    logfile = 
      records.reduce(Tempfile.new) do |file, record|
        line = "[#{record.time}] #{record.remote_host_ip} #{record.interop_service_requested} #{record.http_method} #{record.url} #{record.response_http_code} #{record.consumer_institution_code} #{record.oid_identifier}\n"
        file.tap { |tmp| tmp.write line }
      end
    send_file logfile, disposition: :attachment, filename: "logfile.txt"
  ensure
    logfile.close
  end
end
