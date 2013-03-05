require 'spec_helper'

describe Foy::RubyHandler::CLI do
  describe "#start" do
    context "command parse" do
      before do
        ARGV = ["parse", "file"]
      end

      it "calls parse handler" do
        Foy::RubyHandler.should_receive(:parse).with("file").and_return("")
        Foy::RubyHandler::CLI.start
      end
    end

    context "command version" do
      before do
        ARGV = ["version", "package"]
      end

      it "calls latest version handler" do
        Foy::RubyHandler.should_receive(:latest_version_for).with("package")
        Foy::RubyHandler::CLI.start
      end
    end
  end
end
