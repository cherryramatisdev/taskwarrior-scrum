require "../utils/unix_time"
require "tallboy"
require "./tui"

class TuiPending < Tui
  @table : Tallboy::TableBuilder?

  def initialize(data : TaskWarriorData)
    @table = Tallboy.table do
      columns do
        add "description"
        add "status"
        add "created_at"
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
      [task["description"], task["status"], UnixTime.unix_time_to_string_format(task["entry"].to_i, "%d/%m/%Y")]
    end
  end
end
