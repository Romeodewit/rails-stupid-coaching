require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  Capybara.register_driver :headless_chrome do |app|
    capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
        'goog:chromeOptions': { args: %w(headless window-size=1280,1024 no-sandbox enable-features=NetworkService,NetworkServiceInProcess  disable-features=VizDisplayCompositor) } )
        Watir::Browser.new(:chrome,
                      :prefs => {:password_manager_enable => false, :credentials_enable_service => false},
                      :switches => ["disable-infobars", "no-sandbox"])
    Capybara::Selenium::Driver.new(app, browser: :chrome, desired_capabilities: capabilities)
  end
  driven_by :selenium, using: :headless_chrome
end