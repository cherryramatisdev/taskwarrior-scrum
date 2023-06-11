module CLI
  enum Commands
    Pending
    Daily
    Completed
    Generate
    Unknown

    def self.from_str(str : String) : Commands
      case str
      when "completed"
        Commands::Completed
      when "pending"
        Commands::Pending
      when "daily"
        Commands::Daily
      when "generate"
        Commands::Generate
      else
        Commands::Unknown
      end
    end
  end
end
