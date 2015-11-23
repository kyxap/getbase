class TopBarSettingSection
  include PageObject

  div :user_avatar, css: '[class="user-avatar"]'
  ul :topbarSettingDD, css: '.topbar-settings-dropdown.dropdown-menu'
  i :settings, css: '[class="icon-cog"]'

  def initialize_page
    puts '  init settings section'
    browser.wait_until(10) {loaded?}
  end

  def loaded?
    user_avatar
  end

  def open_settings_page
    self.user_avatar_element.when_visible.click
    self.topbarSettingDD.when_visible do
      self.settings_element.when_visible.click
    end
    return SettingsPage.new browser
  end
end
