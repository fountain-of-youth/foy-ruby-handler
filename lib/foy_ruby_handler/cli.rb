module Foy::RubyHandler
  class CLI
    def self.start
      command, params = ARGV.shift, ARGV

      print case command
      when "parse"
        Foy::RubyHandler.parse(*params)
      when "version"
        Foy::RubyHandler.latest_version_for(*params)
      end
    end
  end
end

Foy::RubyHandler::CLI.start
