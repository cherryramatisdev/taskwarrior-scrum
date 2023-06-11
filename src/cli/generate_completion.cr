require "./cmd"

module CLI
  module GenerateCompletion
    enum ShellType
      Zsh
      Bash
      Unknown

      def self.from_str(str : String) : ShellType
        case str
        when "zsh"
          Zsh
        when "bash"
          Bash
        else
          Unknown
        end
      end
    end

    def self.generate(type : CLI::GenerateCompletion::ShellType, cmd : CLI::Commands, binary_name : String)
      case type
      when CLI::GenerateCompletion::ShellType::Zsh
        self.zsh(cmd.class, binary_name)
      when CLI::GenerateCompletion::ShellType::Bash
        self.bash(cmd.class, binary_name)
      end
    end

    def self.zsh(cmd : CLI::Commands.class, binary_name : String) : String
      branches = cmd.values.map { |c| c.to_s.downcase }
      # TODO: implement ability to define descriptions on the Commands enum and use here.
      branches = branches.map { |c| "'#{c}'" }
      branches = branches.join(" ")

      return <<-ZSH
    #compdef #{binary_name}

    local -a subcmds
    subcmds=(#{branches})
    _describe '#{binary_name}' subcmds
    ZSH
    end

    def self.bash(cmd : CLI::Commands.class, binary_name : String) : String
      raise "To implement"
    end
  end
end
