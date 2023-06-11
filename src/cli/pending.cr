require "../utils/unix_time"
require "../views/tui_pending"

module CLI
  @@folder : String = ENV["TASK_FOLDER"] ||= "#{Path.home}/.task"

  def self.pending(date_to_filter : String? = nil)
    pending_data = File.read("#{@@folder}/pending.data")

    data = DataFile.parse(pending_data)

    unless date_to_filter.nil?
      data = data.select { |task| UnixTime.unix_time_to_string_format(task["entry"].to_i, "%d/%m/%Y") == date_to_filter }
    end

    table = TuiPending.new(data).table

    if table.nil?
      puts "No pending tasks"
      return
    end

    puts table.render
  end
end
