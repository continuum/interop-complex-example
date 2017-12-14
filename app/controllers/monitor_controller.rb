class MonitorController < ApplicationController
  include Tracer
  
  after_action do |controller|
    trace(controller.request, controller.response)
  end
  # GET /monitor.json
  def status
  end

end
