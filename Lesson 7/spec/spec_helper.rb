require 'rspec'
require 'page-object'

RSpec.configure do |config|
  config.before :all do
    @browser = Watir::Browser.new :firefox
    @browser.window.maximize
  end
config.after :all do
  @browser.close
  end
end