class LeadsPage
  include PageObject

  page_section :top_bar, TopBarSection, css: '.pull-left'
  page_section :top_bar_settings, TopBarSettingSection, id: 'user-dd'

  link :newLead, id: 'leads-new'
  text_field :lastName, id: 'lead-last-name'
  button :save, css: '.save'
  span :lead_status, css: '.lead-status'
  body :body, css: '[data-controller="leads"]'
  li :no_leads_text, css: '.item.empty'
  link :select_all_leads_cb, css: '.select-all'
  span :more_action, id: 'leads-more-actions'
  link :leads_delete, id: 'leads-delete'
  link :remove_confirm, css: '.confirm'

  #this method would be executed when you run SomePage.new(browser)
  def initialize_page
    #wait until main button will displayed
    wait_until(10) { loaded? }
  end

  def loaded?
    newLead?
  end

  def lead_created?
    lead_status?
  end

  def create_new_lead_req_fields_only(last_name)
    self.newLead_element.click
    self.lastName = last_name
    self.save
    wait_until(10) { lead_created? }
  end

  def select_created_lead(lead_name)
    #wait_until(10) { loaded? }
    #link_element(xpath: ".//a[text()='#{lead_name}']").click
    puts path = ".//a[text()='#{lead_name}']"
    link_element(xpath: path).when_visible.click
    wait_until(10) { lead_created? }
  end

  def delete_all_leads
    self.select_all_leads_cb_element.click
    self.more_action_element.click
    self.leads_delete_element.click
    self.remove_confirm_element.click
    wait_until(10) { loaded? }
  end

end
