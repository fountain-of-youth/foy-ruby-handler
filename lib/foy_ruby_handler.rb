require "foy_ruby_handler/version"
require "bundler"

module Foy
  module Ruby
    module Handler
      class << self
        def parse(file)
          Bundler::LockfileParser.new(File.open(file, 'r').read)
        end

        def latest_version_for(gem)
          Gem.latest_version_for(gem).version
        end
      end
    end
  end
end
