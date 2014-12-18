require 'fileutils'

Dir['./_posts/*.markdown'].each do |filename|
  next if filename =~ /exploring-my-google-location-history/ # Ignore this file as it was manually updated

  content = File.read(filename)
  File.open(filename, 'w') do |f|
    new_content = content.gsub(/^  /, '')
    f.puts new_content
  end
end
