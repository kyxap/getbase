class SalesPage
  include PageObject

  page_section :top_bar, TopBarSection, css: '.pull-left'

  # li :leads, id: 'nav-item-leads'
  # button :userDD, id: 'user-dd'

end
