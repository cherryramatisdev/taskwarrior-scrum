require "./cli/cmd"
require "./cli/completed"
require "./cli/pending"
require "./cli/daily"

if ARGV.size == 0
  puts "Usage: taskwarrior-scrum <command>"
  exit 1
end

case CLI.from_value(ARGV.first)
when CLI::Commands::Completed
  if ARGV.size > 1
    CLI.completed(ARGV[1])
  else
    CLI.completed
  end
when CLI::Commands::Pending
  if ARGV.size > 1
    CLI.pending(ARGV[1])
  else
    CLI.pending
  end
when CLI::Commands::Daily
  if ARGV.size > 1
    CLI.daily(ARGV[1])
  else
    CLI.daily
  end
else
  puts "Unknown command"
end
