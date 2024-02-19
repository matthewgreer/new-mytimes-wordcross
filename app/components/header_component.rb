# frozen_string_literal: true

class HeaderComponent < ViewComponent::Base

  renders_one :notice, NoticeComponent
  renders_one :navigation, NavigationComponent
  renders_one :logo, LogoComponent

  def initialize(logged_in: false) # maybe pass user here?
    @logged_in = logged_in
  end

end
