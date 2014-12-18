require 'fileutils'

Dir['./_posts/*.textile'].each do |filename|
  content = File.read(filename)
  if content =~ /^:textile/
    File.open(filename, 'w') do |f|
      new_content = content.sub(/^:textile.*\n/, '')
      f.puts new_content
    end
  end
end
