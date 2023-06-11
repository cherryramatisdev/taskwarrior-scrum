require "./cli/cmd"
require "./cli/completed"
require "./cli/pending"
require "./cli/daily"
require "./cli/generate_completion"

if ARGV.size == 0
  puts "Usage: taskwarrior-scrum <command>"
  exit 1
end

command = CLI::Commands.from_str(ARGV.first)

case command
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
when CLI::Commands::Generate
  if ARGV.size <= 1
    puts "Usage: taskwarrior-scrum generate --type=zsh"
    exit 1
  end

  shell_type = ARGV[1].sub("--type=", "")
  puts CLI::GenerateCompletion.generate(CLI::GenerateCompletion::ShellType.from_str(shell_type), command, "taskwarrior-scrum")
else
  puts "Unknown command"
end
