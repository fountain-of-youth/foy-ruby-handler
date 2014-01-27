require 'spec_helper'

describe Foy::RubyHandler do

  describe "#parse" do
    context "Gemfile.lock" do
      let(:parse!) {Foy::RubyHandler.parse("spec/fixtures/Gemfile.lock")} 

      it "uses bundler parser" do
        Bundler::LockfileParser.should_receive(:new)
          .with(File.open("spec/fixtures/Gemfile.lock", 'r'))
          .and_call_original
        parse!
      end

      it "returns current dependencies (name and version)" do
        expect(parse!).to be_eql("rake 10.0.3\nrspec 2.13.0")
      end
    end

    context "gemspec" #TODO
  end

  describe "#latest_version_for" do
    let(:version) { double(:version, version: "2.0.1") }

    it "uses rubygem" do
      Gem.should_receive(:latest_version_for).with("package").and_return(version)
      Foy::RubyHandler.latest_version_for("package")
    end

    it "returns version as string" do
      Gem.stub(:latest_version_for).with("package").and_return(version)
      expect(Foy::RubyHandler.latest_version_for("package")).to be_eql("2.0.1")
    end
  end
end
