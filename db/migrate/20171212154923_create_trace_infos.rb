class CreateTraceInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :trace_infos do |t|
      t.datetime :time
      t.string :remote_host_ip
      t.string :interop_service_requested
      t.string :http_method
      t.string :url
      t.string :response_http_code
      t.string :consumer_institution_code
      t.string :oid_identifier
      t.timestamps
    end
  end
end
