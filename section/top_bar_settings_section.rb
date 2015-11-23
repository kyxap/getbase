class TopBarSettingSection
  include PageObject

  a :userDD, css: '[href="#user-dd"]'
  ul :topbarSettingDD, css: '.topbar-settings-dropdown.dropdown-menu'
  link :settings, css: '[class="icon-cog"]'

  def initialize_page
    puts '  init settings section'
    browser.wait_until(10) {loaded?}
  end

  def loaded?
    userDD?
  end

  def open_settings_page
    self.userDD_element.when_visible.click
    self.settings_element.when_visible.click
    return SettingsPage.new browser
  end
end
