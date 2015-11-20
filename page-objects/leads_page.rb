class LeadsPage
  include PageObject

  page_section :top_bar_settings, TopBarSettingSection, id: 'user-dd'

  a :newLead, id: 'leads-new'
  text_field :lastName, id: 'lead-last-name'
  button :save, css: '.save'
  span :lead_status, css: '.lead-status'
  body :body, css: '[data-controller="leads"]'

  #this method would be executed when you run SomePage.new(browser)
  def initialize_page
    #wait until main button will displayed
    wait_until(10) { loaded? }
  end

  def loaded?
    body?
  end

  def lead_created?
    lead_status?
  end

  def create_new_lead_req_fields_only(last_name)
    self.newLead_element.click()
    self.lastName = last_name
    self.save
    wait_until(10) { lead_created? }
  end

  def select_created_lead(lead_name)
    element a, xpath: '//*[text()="#{lead_name}"]'
  end

end
