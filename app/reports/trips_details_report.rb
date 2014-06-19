class TripsDetailsReport < AbstractReport

  def initialize(attributes = {})
    super(attributes)
  end    
  
  def get_data(current_user, report)
    date_option = DateOption.find(report.date_range)
    date_option ||= DateOption.find_by(code: 'date_option_all')
    
    Trip.all.includes(:user, :creator, :trip_places, :trip_purpose, :desired_modes)
      .where(scheduled_time: date_option.get_date_range).decorate
  end

  def get_columns
    [:id, :user, :assisted_by, :modes,
     :from, :from_lat, :from_lon, :out_arrive_or_depart, :from_datetime,
     :to, :to_lat, :to_lon, :in_arrive_or_depart, :to_datetime, :round_trip,
     :eligibility, :accommodations, :outbound_itinerary_count, :return_itinerary_count,
     :status, :device, :location, :trip_purpose, :outbound_selected_short, :return_selected,]
  end

end