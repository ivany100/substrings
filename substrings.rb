# substrings takes a word as a first argument and then
# an array of valid substrings
# returns a hash listing each substring and how many
# times it was found
def substrings(word, substrings_array)
  word = word.downcase
  substrings_count = Hash.new(0)

  substrings_array.each do |substring|
    substring = substring.downcase

    # substring compliance counter
    # if counter equals the length of the substring, add to the resulting hash
    i = 0

    word.length.times do |n|
      if word[n] == substring[i]
        i += 1
      else
        i = 0
      end
      if i == substring.length
        substrings_count[substring] += 1
        i = 0
      end
    end
  end

  substrings_count
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

puts substrings("below", dictionary)
# => { "below" => 1, "low" => 1 }
puts substrings("Howdy partner, sit down! How's it going?", dictionary)
#  => { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }
