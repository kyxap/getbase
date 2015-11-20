class TopBarSettingSection
  include PageObject

  button :userDD, id: 'user-dd'
  a :userDD, css: '[href="#user-dd"]'
  ul :topbarSettingDD, css: '.topbar-settings-dropdown.dropdown-menu'
  link :settings, css: '[href="/settings/profile"]'

  def open_settings_page
    self.userDD_element.click()
    #wait_until(10) { settings_dd_loaded? }
    self.settings_dd_loaded?
    self.settings_element.click()
    SettingsPage.new browser
  end

  def settings_dd_loaded?
    topbarSettingDD?
  end
end
