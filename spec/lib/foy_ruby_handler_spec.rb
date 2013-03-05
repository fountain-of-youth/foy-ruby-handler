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

  describe "#latest_version_for" do
    let(:version) { mock(:version, version: "2.0.1") }

    it "uses rubygem" do
      Gem.should_receive(:latest_version_for).with("package").and_return(version)
      Foy::Ruby::Handler.latest_version_for("package")
    end

    it "returns version as string" do
      Gem.stub(:latest_version_for).with("package").and_return(version)
      expect(Foy::Ruby::Handler.latest_version_for("package")).to be_eql("2.0.1")
    end
  end
end
