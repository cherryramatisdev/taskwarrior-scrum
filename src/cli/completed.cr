require "../data-file/parser"
require "../views/tui_completed"
require "../utils/unix_time"

module CLI
  @@folder : String = ENV["TASK_FOLDER"] ||= "#{Path.home}/.task"

  def self.completed(date_to_filter : String? = nil)
    completed_data = File.read("#{@@folder}/completed.data")

    data = DataFile.parse(completed_data)

    data = data.select { |task| task["status"] == "completed" }

    unless date_to_filter.nil?
      data = data.select { |task| UnixTime.unix_time_to_string_format(task["entry"].to_i, "%d/%m/%Y") == date_to_filter }
    end

    table = TuiCompleted.new(data).table

    if table.nil?
      puts "No completed tasks"
      return
    end

    puts table.render
  end
end
