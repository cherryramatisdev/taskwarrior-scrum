require "../data-file/parser"
require "../views/tui"

module CLI
  @@folder : String = ENV["TASK_FOLDER"] ||= "#{Path.home}/.task"

  def self.completed
    completed_data = File.read("#{@@folder}/completed.data")

    data = DataFile.parse(completed_data)

    data = data.select { |task| task["status"] == "completed" }

    table = Tui.new(data).table

    if table.nil?
      puts "No completed tasks"
      return
    end

    puts table.render
  end
end
