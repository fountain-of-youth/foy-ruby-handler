require 'spec_helper'

require 'foy_ruby_handler'

describe Foy::Ruby::Handler do

  describe "#parse" do
    context "Gemfile.lock" do
      it "uses bundler parser" do
        Bundler::LockfileParser.should_receive(:new).with("Gemfile content\n").and_return(nil)
        Foy::Ruby::Handler.parse("spec/fixtures/Gemfile")
      end

      it "returns current dependencies (name and version)" do
        Foy::Ruby::Handler.parse("spec/fixtures/Gemfile.lock").specs.collect{|d| [d.name, d.version]}
      end
    end

    context "gemspec" #TODO
  end
end
