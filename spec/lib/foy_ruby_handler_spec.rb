require 'spec_helper'

require 'foy_ruby_parser'

describe Foy::Ruby::Parser do

  describe "#parse" do
    context "Gemfile.lock" do
      it "uses bundler parser" do
        Bundler::LockfileParser.should_receive(:new).with("Gemfile content\n").and_return(nil)
        Foy::Ruby::Parser.parse("spec/fixtures/Gemfile")
      end

      it "returns current dependencies (name and version)" do
        Foy::Ruby::Parser.parse("spec/fixtures/Gemfile.lock").specs.collect{|d| [d.name, d.version]}
      end
    end

    context "gemspec" #TODO
  end
end
