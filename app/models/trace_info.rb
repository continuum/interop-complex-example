class TraceInfo < ApplicationRecord
  scope :between_dates, -> (start_date, final_date) {
    where("time >= ? AND time <= ?",
          Time.zone.parse(start_date),
          Time.zone.parse(final_date))
  }
end
