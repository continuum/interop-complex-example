module Tracer
  def trace(request, response)
    # This could also be a job, since it will delay sending the response to the client
    TraceInfo.create!(
                     time: Time.zone.now,
                     remote_host_ip: request.ip,
                     interop_service_requested: request.host,
                     http_method: request.request_method,
                     url: request.url,
                     response_http_code: response.status.to_s,
                     consumer_institution_code: request.headers.fetch('HTTP_REQUESTER_ORGANIZATION_ID', 'INFO NOT SENT'),
                     oid_identifier: 'OIDOID'
                     )
  end
end