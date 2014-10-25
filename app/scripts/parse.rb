next_line_book = false
next_line_chapter = false
verse = 1
book = ""
chapter = ""

File.open("bible_cv.txt", "r").each_line do |line|
  line.strip!
  next if line.size == 0
  if next_line_book
    book = line
    next_line_book = false
    next_line_chapter = true
    next
  end
  if next_line_chapter
    #if line.match /^chapter \d$/
    chapter = line
    verse = 1
    next_line_book = false
    next_line_chapter = false
    next
    #end
  end
  if line == "the book of"
    next_line_book = true
    next_line_chapter = false
    next
  end
  puts "#{book} - #{chapter}:#{verse} - #{line}"
  verse += 1
end
