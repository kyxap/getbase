class SettingsPage
  include PageObject

  page_section :top_bar, TopBarSection, css: '.pull-left'

  div :body, id: 'body'
  link :leads, css: '[href="/settings/leads"]'
  link :lead_statuses, css: '[href="#lead-status"]'
  link :tags, css: '[href="#tags"]'
  button :new_edit, xpath: '(//*[@id="lead-status"]//button)[1]'
  text_field :new_name, id: 'name'
  button :new_save, xpath: '(//*[@id="lead-status"]//button)[1]'

  def initialize_page
    wait_until(10) { loaded? }
  end

  def loaded?
    leads?
  end

  def change_lead_status(new_name)
    self.leads
    self.lead_statuses
    self.new_edit
    browser.execute_script "document.getElementsByName('name')[3].value='#{new_name}'"
    self.new_save_element.when_visible.click
  end
end
