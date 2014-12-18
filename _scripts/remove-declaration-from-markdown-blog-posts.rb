require 'fileutils'

Dir['./_posts/*.markdown'].each do |filename|
  content = File.read(filename)
  if content =~ /^:markdown$/
    File.open(filename, 'w') do |f|
      new_content = content.sub(/^:markdown\n/, '')
      f.puts new_content
    end
  end
end
