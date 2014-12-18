require 'fileutils'

Dir['./_posts/*.markdown'].each do |filename|
  content = File.read(filename)
  if content =~ /^filter:.*$/
    File.open(filename, 'w') do |f|
      new_content = content.sub(/^filter:.*\n/, '')
      f.puts new_content
    end
  end
end
