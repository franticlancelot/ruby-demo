lines = File.readlines('oliver.txt')
stop_words = %w{the a by on for of are with just but and to the my I has some in }
line_count = lines.size
text = lines.join

#Count the characters
total_characters  = text.length
total_characters_nospaces = text.gsub(/\s+/,'').length
total_characters_nospaces2 = text.gsub(/\s+/,'').length

#Count the words, sentences and paragraphs
word_count = text.split.length
sentence_count = text.split(/\.|\?|!/).length
paragraph_count = text.split(/\n\n/).length


#Make a list of words in the text that are't stop words,
#count them, and work out the percentage of non-stop words
#against all words
all_words   = text.scan(/\w+/)
good_words  = all_words.select{|word| !stop_words.include?(word)}

good_percentage = ((good_words.length.to_f / all_words.length.to_f) * 100).to_i

#Summary
sentences = text.gsub(/\s+/, ' ').strip.split(/\.|\?|!/)
sentences_sorted = sentences.sort_by{ |sentence| sentence.length}
one_third = sentences_sorted.length / 3
ideal_sentences = sentences_sorted.slice(one_third, one_third+1)
ideal_sentences = ideal_sentences.select{|sentence| sentence =~ /is|are/}

puts "#{line_count} lines"
puts "#{total_characters} chars"
puts "#{total_characters_nospaces} chars (excluding spaces)"
puts "#{word_count} words"
puts "#{paragraph_count} paragraphs"
puts "#{sentence_count} setences"
puts "#{sentence_count / paragraph_count} sentences per paragraph"
puts "#{word_count / sentence_count} words per sentence"

puts "#{good_percentage}% of words are non-fluff words"

puts "Summary:\n\n" + ideal_sentences.join(".").strip
puts "--End of analysis"
