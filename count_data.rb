require_relative 'parse_by_date'
require_relative 'print_by_count'


#Time Complexity: O(l*m + n*klogk) 
# where l is number of lines in txt file,
# where m is site name length
# where n is the number of dates 
# where k is the number of unique site names for the day
# In the given problem, there are conditionals where it states 
def start(file_name)
  puts ""
  puts "Hey! Let's count how many hits these websites got."
  puts ""
  organized_data = parse_by_date(file_name) 
  print_by_count(organized_data)
  puts ""
end 


file_name = ARGV
start(file_name[0])