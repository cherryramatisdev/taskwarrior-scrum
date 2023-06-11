require "tallboy"

abstract class Tui
  alias TaskWarriorData = Array(Hash(String, String))

  getter table : Tallboy::TableBuilder?

  abstract def rows(data : TaskWarriorData) : Array(Array(String))
end
