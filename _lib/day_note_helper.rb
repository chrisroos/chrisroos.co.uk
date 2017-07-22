require 'active_support/inflector'

def date_from_filename(filename)
  # filename will be of the form: 'yyyy mm dd day notes'
  date = filename[/(\d{4} \d{2} \d{2})/, 1]
  Date.strptime(date, "%Y %m %d")
end

def day_note_title(filename)
  date            = date_from_filename(filename)
  ordinalised_day = ActiveSupport::Inflector.ordinalize(date.day)
  ['Day notes', date.strftime("%a #{ordinalised_day} %b %Y")].join(' - ')
end

def day_note_summary(filename)
  date            = date_from_filename(filename)
  ordinalised_day = ActiveSupport::Inflector.ordinalize(date.day)
  ['Notes from', date.strftime("%A #{ordinalised_day} %B %Y")].join(' ')
end
