paths = Dir['content/blog/*.txt']

paths.each do |path|
  content = File.read(path)

  match = content.match(/(^---$.*^---$\n)(.*)/m)
  metadata = match[1]
  body = match[2]

  if metadata =~ /^filter:.*textile$/
    metadata.sub!(/textile/, 'markdown')

    File.open('/tmp/wem.textile', 'w') { |file| file.puts(body) }
    markdown = `pandoc --wrap=none -f textile -t markdown /tmp/wem.textile`

    File.open(path, 'w') do |file|
      file.puts(metadata)
      file.puts(markdown)
    end
  end
end
