class UnixTime
  def self.unix_time_to_string_format(unix_time : Int32, format : String) : String
    Time.unix(unix_time).to_s(format)
  end
end
