require "foy_ruby_parser/version"
require "bundler"

module Foy
  module Ruby
    module Parser
      class << self
        def parse(file)
          Bundler::LockfileParser.new(File.open(file, 'r').read)
        end
      end
    end
  end
end
