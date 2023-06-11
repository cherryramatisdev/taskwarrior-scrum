require "time"
require "./completed"
require "./pending"

module CLI
  def self.daily(date : String? = nil)
    filter_date = date ||= (Time.local - 24.hours).to_s("%d/%m/%Y")

    puts "----------- COMPLETED DATA -----------"
    CLI.completed(filter_date)

    puts "----------- PENDING DATA -----------"
    CLI.pending(filter_date)
  end
end
