Dir['./_posts/*.txt'].each do |filename|
  content = File.read(filename)
  File.open(filename, 'w') do |f|
    f.puts content
  end
end
