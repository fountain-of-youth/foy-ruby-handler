require "bundler"
require_relative "foy_ruby_handler/version"
require_relative "foy_ruby_handler/cli"

module Foy
  module RubyHandler
    class << self
      def parse(file)
        lockfile = Bundler::LockfileParser.new(File.open(file, 'r').read)
        dependencies = lockfile.dependencies.collect(&:name)
        lockfile.specs.collect do |spec|
          "#{spec.name} #{spec.version}" if dependencies.include?(spec.name)
        end.compact.join("\n")
      end

      def latest_version_for(gem)
        Gem.latest_version_for(gem).version
      end
    end
  end
end
