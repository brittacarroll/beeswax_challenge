# assuming that string has a length and is not nil or empty
# written in Ruby

def balanced_or_not(string)

  return -1 if !string.include?("{") || !string.include?("}")

  separate_elements = string.chars.each_slice(1).map(&:join)

  braces = separate_elements.find_all { |e| e == "{" || e == "}" }
  open_braces = braces.find_all { |e| e == "{" }
  closed_braces = braces.find_all { |e| e == "}" }

  if open_braces && closed_braces
    return -1 if open_braces.count == closed_braces.count
  end

  index = -1
  braces.each do |b|
    if (b == "{" && braces[index] == "}") || (b == "}" && braces[index]== "{")
      next
    else
      return braces.index(b)
    end
    index -= 1
  end
end
