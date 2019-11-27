Webby::Filters.register :markdown do |input|
  RDiscount.new(input, :smart).to_html
end
