require 'time'
module DateTimeFormattingHelper
  def rfc822_datetime(page)
    page.created_at.rfc822
  end
end

Webby::Helpers.register(DateTimeFormattingHelper)
