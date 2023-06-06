require "tallboy"

class Tui
  alias TaskWarriorData = Array(Hash(String, String))

  def self.new(data : TaskWarriorData)
    table = Tallboy.table do
      columns do
        add "description"
        add "status"
        add "uuid"
      end

      header

      rows Tui.rows(data)
    end
  end

  def self.rows(data : TaskWarriorData) : Array(Array(String))
    data.map do |task|
      [task["description"], task["status"], task["uuid"]]
    end
  end
end
