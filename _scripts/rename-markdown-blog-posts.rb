require 'fileutils'

Dir['./_posts/*.txt'].each do |filename|
  content = File.read(filename)
  if content =~ /:markdown/
    new_filename = filename.sub(/\.txt$/, '.markdown')
    FileUtils.mv(filename, new_filename)
  end
end
