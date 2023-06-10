require "./cli/cmd"
require "./cli/completed"
require "./cli/pending"

if ARGV.size == 0
  puts "Usage: taskwarrior-scrum <command>"
  exit 1
end

case CLI.from_value(ARGV.first)
when CLI::Commands::Completed
  CLI.completed
when CLI::Commands::Pending
  CLI.pending
else
  puts "Unknown command"
end
