class TopBarSection
  include PageObject

  li :leads, id: 'nav-item-leads'
  ul :nav_main, id: 'nav-main'

  def initialize_page
    puts 'init tob bar section'
    browser.wait_until(10) {loaded?}
  end

  def loaded?
    nav_main?
  end

  def select_leads_tab
    self.leads_element.when_visible.click
    return LeadsPage.new browser
  end
end
