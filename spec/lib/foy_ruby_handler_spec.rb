require 'spec_helper'

describe Foy::RubyHandler do

  describe "#parse" do
    context "Gemfile.lock" do
      let(:parse!) {Foy::RubyHandler.parse("spec/fixtures/Gemfile")} 

      it "uses bundler parser" do
        Bundler::LockfileParser.should_receive(:new)
          .with("GEM\n  remote: http://rubygems.org/\n  specs:\n    package (1.7.1)\n")
          .and_call_original
        parse!
      end

      it "returns current dependencies (name and version)" do
        expect(parse!).to be_eql("package 1.7.1")
      end
    end

    context "gemspec" #TODO
  end

  describe "#latest_version_for" do
    let(:version) { mock(:version, version: "2.0.1") }

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
