# require 'date'
require 'active_support/inflector'

def day_note_title(filename)
  # filename will be of the form: 'yyyy mm dd day notes'
  date = filename[/(\d{4} \d{2} \d{2})/, 1]
  date = Date.strptime(date, "%Y %m %d")

  ordinalised_day = ActiveSupport::Inflector.ordinalize(date.day)
  ['Day notes', date.strftime("%a #{ordinalised_day} %b %Y")].join(' - ')
end