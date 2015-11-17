

RSpec.configure do |config|

  config.before :all do
    browser = Watir::Browser.new
    browser.goto 'https://core.futuresimple.com/users/login'
  end

  # Close that browser after each example.
  config.after :all do
    browser.close if @browser
    headless.destroy if @headless
  end
end