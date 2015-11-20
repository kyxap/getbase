class TopBarSection
  include PageObject

  li :leads, id: 'nav-item-leads'
  button :userDD, id: 'user-dd'

  def select_leads_tab
    self.leads_element.click()
    LeadsPage.new browser
  end

end
