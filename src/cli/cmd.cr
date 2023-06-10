module CLI
  enum Commands
    Pending
    Completed
    Unknown
  end

  def self.from_value(value : String) : CLI::Commands
    case value
    when "completed"
      Commands::Completed
    when "pending"
      Commands::Pending
    else
      Commands::Unknown
    end
  end
end
