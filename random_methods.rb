# Random methods and class modifiers to add to my own gem

def rand_alpha(x, y, letter_case)
  alphabet = 'abcdefghijklmnopqrstuvwxyz'
  x_index = alphabet.index(x)
  y_index = alphabet.index(y)
  alpha_index = rand(x_index..y_index)
  alpha = alphabet[alpha_index]
  if letter_case == 'l' || letter_case == false then
    return alpha
  elsif letter_case == 'c' || letter_case == true then
    return alpha.capitalize
  else
    puts "INVALID CASE"
    return alpha
  end
end

def quickWrite(file, item)
  somefile = open(file, 'a+')
  somefile.puts item
  somefile.close
end

def scan_file(file, thing)
  array = Array.new
  begin
    somefile = open(file, 'r')

    somefile.readlines do |line|
        if line.match(/#{thing}/) then
          array += true
        else
          array += false
        end
    end
    somefile.close
    return array
  rescue
    return nil
  end
end

class Array
  def puts_all
    self.each do |item|
      puts item
    end
  end
  def print_all
    self.each do |item|
      print "#{item} "
    end
  end
  def write_all(file)
    somefile = open(file, 'a')
    self.each do |item|
      somefile.puts(item)
    end
    somefile.close
  end

  def alt_scan(item) # test array for a substring, if string contains substring return the string
    self.each do |var|
      begin
        if var[item] then
          return var
        end
      rescue
        return nil
      end
    end
  end

  def bool_scan(item)
    self.each do |var|
      begin
        if var == item then
          return true
        end
      rescue
        return false
      end
    end
  end

end

class String
  def index_all(sub_one)
    returned = (0 ... self.length).find_all { |i| self[i,1] == sub_one }
    return returned
  end

  def half
    strL = self.length
    strH = strL / 2
    newString = self[0..strH]
    return newString
  end

  def quarter
    strL = self.length
    strH = strL / 4
    newString = self[0..strH]
    return newString
  end

  def three_quarters
    strL = self.length
    strH = strL - (strL / 4)
    newString = self[0..strH]
    return newString
  end

  def test_for(item)
    if self[item] then
      return true
    else
      return false
    end
  end
  # made for link class
  #VITAL FOR LINKS
  # used for my webcrawling needs
  domainEnd = ['.com/', '.org/', '.gov/', '.mil/', '.net/', '.de/', '.cr/', '.cz/', '.to/', '.ca/'] # for some reason, 'gov' does not work
  @@Domains = Regexp.union(domainEnd)
  def index_domain # gives index of the domain ending
    domainIndex = self.index(@@Domains)
    if domainIndex == nil then
      return nil
    else
      return domainIndex
    end
  end

  def domain # returns all of the url before and including the domain ending
    domainIndex = self.index(@@Domains)
    if domainIndex == nil then
      return nil
    else
      domainEnd = domainIndex + 3
      domainName = self[0..domainEnd]
      return domainName
    end
  end

  def find_items(item)
    string = (0 ... self.length).find_all { |i| self[i,1] == "#{item}"}
    return string
  end

  def str_return(space_number) # fix this later
    self.insert(space_number.to_i, "\n")
  end
=begin
  def auto_return(char_number)

    newString = self
    length = self.length
    index_spaces = self.find_items(' ')

    index_spaces.each { |space|
      ind_val = char_number
      if space > 399 then

        new_val = space - ind_val

        if new_val >= 199 then
          newString.insert(new_val, "\n")
        end

      end
    }

    return newString

  end

end
=end
class Fixnum
  def even?
    even = self % 2
    if even == 0 then
      return true
    else
      return false
    end
  end
  def power(n)
    if n == 0 then
      return 1
    else
      allNumbers = []
      n.times do
        allNumbers += [self]
      end
      final = 1
      allNumbers.each do |number|
        final *= number
      end
      return final
    end
  end

  def square
    final = self * self
    return final
  end

  def cube
    final = self * self * self
    return final
  end
end

class Float
  def even?
    even = self % 2
    if even == 0 then
      return true
    else
      return false
    end
  end
  def power(n)
    if n == 0 then
      return 1
    else
      allNumbers = []
      n.times do
        allNumbers += [self]
      end
      final = 1
      allNumbers.each do |number|
        final *= number
      end
      return final
    end
  end

  def square
    final = self * self
    return final
  end

  def cube
    final = self * self * self
    return final
  end
end
end
