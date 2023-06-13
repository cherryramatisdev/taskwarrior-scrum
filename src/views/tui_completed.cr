require "tallboy"
require "./tui"
require "../utils/unix_time"

class TuiCompleted < Tui
  @table : Tallboy::TableBuilder?

  def initialize(data : TaskWarriorData)
    @table = Tallboy.table do
      columns do
        add "description"
        add "status"
        add "tags"
        add "created_at"
        add "ended_at"
        add "time spent"
      end

      header

      rows self.rows(data)
    end
  end

  def table
    @table
  end

  private def rows(data : TaskWarriorData) : Array(Array(String))
    data.map do |task|
      [task["description"], task["status"], task["tags"] ||= "N/A", self.unix_time_to_date(task["entry"].to_i), self.unix_time_to_date(task["end"].to_i), self.unix_time_to_time(task["end"].to_i - task["entry"].to_i)]
    end
  end

  private def unix_time_to_date(unix_time : Int32) : String
    UnixTime.unix_time_to_string_format(unix_time, "%d/%m/%Y")
  end

  private def unix_time_to_time(unix_time : Int32) : String
    UnixTime.unix_time_to_string_format(unix_time, "%H:%M")
  end
end
