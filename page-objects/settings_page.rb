class SettingsPage
  include PageObject

  page_section :top_bar, TopBarSection, css: '.pull-left'

  div :body, id: 'body'
  link :leads, css: '[href="/settings/leads"]'
  link :lead_statuses, css: '[href="#lead-status"]'
  link :tags, css: '[href="#tags"]'
  button :new_edit, xpath: '(//*[@id="lead-status"]//button)[1]'
  text_field :new_name, id: 'name'
  button :new_save, xpath: '(//*[@id="lead-sources"]//button)[1]'

  #this method would be executed when you run SomePage.new(browser)
  def initialize_page
    #wait until main button will displayed
    wait_until(10) { loaded? }
  end

  def loaded?
    leads?
  end

  def change_lead_status(new_name)
    @leads
    @lead_statuses
    @new_edit
    @new_name = new_name
    @new_save
  end



end
