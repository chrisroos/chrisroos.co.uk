require 'fileutils'

Dir['./_posts/*.txt'].each do |filename|
  content = File.read(filename)
  if content =~ /:textile/
    new_filename = filename.sub(/\.txt$/, '.textile')
    FileUtils.mv(filename, new_filename)
  end
end
