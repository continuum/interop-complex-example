class TraceInfo < ApplicationRecord
  scope :between_dates, -> (start_date, final_date) {
    if [start_date, final_date].include? nil
      start_date = (Time.zone.now - 1.day).strftime("%Y-%m-%d")
      final_date = Time.zone.now.strftime("%Y-%m-%d")
    end
    where("time >= ? AND time <= ?",
          Time.zone.parse(start_date),
          Time.zone.parse(final_date))
  }
end
