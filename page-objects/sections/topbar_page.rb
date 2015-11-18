class TopbarPage
  include PageObject

  li :leads, id: 'nav-item-leads'
  button :userDD, id: 'user-dd'

  def goToLeadsTab()
    self.leads
  end
end
