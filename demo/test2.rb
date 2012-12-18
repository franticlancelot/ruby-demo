stop_words = %w{the a by on for of are with just but and to the my I has some in}
text       = %q{Los Angeles has some of the nicest weather in the country.}

words = text.scan(/\w+/)
key_words  = words.select{|word| !stop_words.include?(word)}
key_words  = key_words.join(' ')
puts key_words


sentences_sorted = sentences.sort_by{ |sentence| sentence.length }
one_third   = sentences_sorted.length / 3
ideal_sentences = sentences_sorted.slice(one_third,one_third+1)
ideal_sentences = sentences_sorted.select{ | sentence | sentence =~ /is|are/ }
puts ideal_sentences.join('. ')
