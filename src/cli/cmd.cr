module CLI
  enum Commands
    Pending
    Daily
    Completed
    Unknown
  end

  def self.from_value(value : String) : CLI::Commands
    case value
    when "completed"
      Commands::Completed
    when "pending"
      Commands::Pending
    when "daily"
      Commands::Daily
    else
      Commands::Unknown
    end
  end
end
