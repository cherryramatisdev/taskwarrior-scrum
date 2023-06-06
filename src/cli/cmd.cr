module CLI
  enum Commands
    Completed
    Unknown
  end

  def self.from_value(value : String) : CLI::Commands
    case value
    when "completed"
      Commands::Completed
    else
      Commands::Unknown
    end
  end
end
