require 'fileutils'

Dir['./_posts/*.textile'].each do |filename|
  content = File.read(filename)
  File.open(filename, 'w') do |f|
    new_content = content.gsub(/^  /, '')
    f.puts new_content
  end
end
