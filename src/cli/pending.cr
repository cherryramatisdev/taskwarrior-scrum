require "../views/tui"

module CLI
  @@folder : String = ENV["TASK_FOLDER"] ||= "#{Path.home}/.task"

  def self.pending
    pending_data = File.read("#{@@folder}/pending.data")

    data = DataFile.parse(pending_data)

    table = Tui.new(data).table

    if table.nil?
      puts "No pending tasks"
      return
    end

    puts table.render
  end
end
