require "tallboy"

class Tui
  alias TaskWarriorData = Array(Hash(String, String))

  def self.new(data : TaskWarriorData)
    table = Tallboy.table do
      columns do
        add "description"
        add "status"
        add "uuid"
        add "created_at"
      end

      header

      rows Tui.rows(data)
    end
  end

  def self.rows(data : TaskWarriorData) : Array(Array(String))
    data.map do |task|
      [task["description"], task["status"], task["uuid"], Time.unix(task["entry"].to_i).to_s("%d/%m/%Y %H:%M")]
    end
  end
end
