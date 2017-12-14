class TraceabilityController < ApplicationController
  include TarGenerator

  def logs
    send_tarred_and_gzipped_logs_between_dates(params[:inicio], params[:fin])
  end

  def send_tarred_and_gzipped_logs_between_dates(start_date, end_date)
    tar_container = File.open(Tempfile.new, 'a')
    TraceInfo.between_dates(start_date, end_date)
             .to_a
             .group_by { |record| record.time.strftime("%Y-%m-%d") }
             .each_pair
             .reduce(Gem::Package::TarWriter.new(tar_container)) do |tarfile, (date,records)|
               fill_tar_with_logfiles(tarfile, [date, records], tar_container)
             end

    send_file(
              gzip(tar_container),
              disposition: :attachment,
              filename: name_zipfile(start_date, end_date)
             )
    ensure
      tar_container.close
      # Cant use File.delete(container) or the download fails
  end

  def name_zipfile(start_date, end_date)
    initial_date_string = 
      unless [start_date, end_date].include? nil 
        Time.zone.parse(start_date).strftime("%Y-%m-%d")
      else
        (Time.zone.now - 1.day).strftime("%Y-%m-%d")
      end

    final_date_string = 
      unless [start_date ,end_date].include? nil
        Time.zone.parse(end_date).strftime("%Y-%m-%d")
      else
        Time.zone.now.strftime("%Y-%m-%d")
      end
    "instituciones-#{initial_date_string}-#{final_date_string}.tar.gz"
  end

  def fill_tar_with_logfiles(tarfile, (date, records), tar_container)
    # Makes the logfile
    logfile = records.reduce(File.open(Tempfile.new, 'a'),
                              &method(:create_logfile))
    # adds it to the tarfile
    add_to_tar(logfile, "instituciones-#{date}.log", tarfile, tar_container)
    tarfile
    ensure
      logfile.close
      File.delete(logfile)
  end

  def create_logfile(log_tmpfile, record)
    line = "[#{record.time}] #{record.remote_host_ip} #{record.interop_service_requested} #{record.http_method} #{record.url} #{record.response_http_code} #{record.consumer_institution_code} #{record.oid_identifier}\n"
    log_tmpfile.tap { |file| file.write line }
    log_tmpfile.rewind
    log_tmpfile 
  end
end
