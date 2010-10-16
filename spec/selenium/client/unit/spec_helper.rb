require "selenium-client"
require "stringio"

require "selenium/rspec/extensions"
require "selenium/rspec/reporting/file_path_strategy"
require "selenium/rspec/reporting/system_capture"

# for bamboo
require "ci/reporter/rspec"
ENV['CI_REPORTS'] = "build/test_logs"

module SeleniumClientSpecHelper
  def capture_stderr(&blk)
    io = StringIO.new
    orig, $stderr = $stderr, io

    begin
      yield
    ensure
      $stderr = orig
    end

    io.string
  end
end

Spec::Runner.configure do |config|
  config.include(SeleniumClientSpecHelper)
end