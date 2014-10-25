book = ""
chapter = 1
verse = 1
text = ""
all_verses = []

File.open("bible_kjv.txt", "r").each_line do |line|
  line.strip!
  next if line.size == 0
  if m = line.match(/(^Book) (\d+) \s+ (\w+)$/)
    all_verses << {book: book, chapter: chapter, verse: verse, text: text} if text.size > 0
    book = m[3]
    text = ""
    next
  end
  if m = line.match(/^(\d+):(\d+):(\d+)(\s+)(.*)$/)
    all_verses << {book: book, chapter: chapter, verse: verse, text: text} if text.size > 0
    chapter = m[2].to_i
    verse   = m[3].to_i
    text    = m[5]
    next
  end
  text = text + line
end

all_verses << {book: book, chapter: chapter, verse: verse+1, text: text}
p all_verses.first.inspect

File.open("in_json", "w") do |f|
  all_verses.each do |v|
    f.puts "{book: \"#{v[:book]}\", chapter: #{v[:chapter]}, verse: #{v[:verse]}, text: \"#{v[:text]}\"},"
  end
end
