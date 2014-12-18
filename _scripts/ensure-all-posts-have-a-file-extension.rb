require 'fileutils'

Dir['./_posts/*'].each do |filename|
  if File.extname(filename) == ''
    new_filename = filename + '.txt'
    FileUtils.mv filename, new_filename
  end
end
