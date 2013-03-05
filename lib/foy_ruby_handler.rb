require "bundler"
require "foy_ruby_handler/version"
require "foy_ruby_handler/cli"

module Foy
  module RubyHandler
    class << self
      def parse(file)
        lockfile = Bundler::LockfileParser.new(File.open(file, 'r').read)
        lockfile.specs.collect{|d| "#{d.name} #{d.version}"}.join("\n")
      end

      def latest_version_for(gem)
        Gem.latest_version_for(gem).version
      end
    end
  end
end
