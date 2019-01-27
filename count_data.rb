# You can use any language of choice, e.g. Java, C++, Scala, Python, Ruby, etc. The exercise has no time limit. 
# Please submit the solution and build instruction if applicable to exercise@nyansa.com via Google Drive/Dropbox/Github (preferred) or as attachment.


# Problem:

# You’re given an input file. Each line consists of a timestamp (unix epoch in seconds) and a url separated by ‘|’ (pipe operator). 
# The entries are not in any chronological order. 
# Your task is to produce a daily summarized report on url hit count, organized daily (mm/dd/yyyy GMT) with the earliest date appearing first. 
# For each day, you should display the number of times each url is visited in the order of highest hit count to lowest count. 
# Your program should take in one command line argument: input file name. The output should be printed to stdout. 
# You can assume that the cardinality (i.e. number of distinct values) of hit count values and the number of days are much smaller than the number of unique URLs. 
# You may also assume that number of unique URLs can fit in memory, but not necessarily the entire file.


# input.txt

# 1407564301|www.nba.com
# 1040747821|www.facebook.com
# 1407478022|www.facebook.com
# 1407481200|news.ycombinator.com
# 1407478028|www.google.com
# 1407564301|sports.yahoo.com
# 1407564300|www.cnn.com
# 1407564300|www.nba.com
# 1407564300|www.nba.com
# 1407564301|sports.yahoo.com
# 1407478022|www.google.com
# 1407648022|www.twitter.com


# Output

# 08/08/2014 GMT
# www.facebook.com 2
# www.google.com 2
# news.ycombinator.com 1
# 08/09/2014 GMT
# www.nba.com 3
# sports.yahoo.com 2
# www.cnn.com 1
# 08/10/2014 GMT
# www.twitter.com 1


# Correctness, efficiency (speed and memory) and code cleanliness will be evaluated. Please provide a complexity analysis in Big-O notation for your program along with your source. 



#output needs to be by date then organized by count
#maybe make key in hash by date then value is 

#O(n) + O(nlogn) === O(nlogn)
def start
  puts ""
  puts "Hey! Let's count how many hits these websites got."
  puts "Enter the file name with its .txt extension if its in the same directory or complete file path"
  file_name = gets.chomp
  puts ""
  puts "Counting from #{file_name}..."
  puts ""
  organized_data = parse_by_date(file_name) #O(l*m) l is number of lines in txt file, m is sitename length
  print_by_count(organized_data) # O(n*klogk)
                                    #O(l*m + n*klogk), n is number of dates, k is number of sites for that day
  puts ""
end 
# puts "Results as seen below"


def parse_by_date(filename)
  ##overall time compexity O(file_lines) * (O(URL.length + URL.length + URL.length)) === O(n*m),  n= file lines, m = url length since URL is typically much smaller

  #worst case scenario if all entries are all on different days O(n)
  organized_by_date_data = Hash.new { |h, k| h[k] = {} }
      
  #.each does a O(line) === O(n)
  File.open(filename).each do |line| 
    split_data = line
    split_data.delete!("\n") #O(line.length), which will typically way smaller than amount of lines
    split_data = split_data.split("|")  #same as above. #O(line.length)
    # split does worst case scenario almost O(n)

    #create a helper function for converted date
    converted_date = Time.at(split_data[0].to_i).utc.strftime("%m/%d/%Y GMT")

      
    if organized_by_date_data[converted_date][split_data[1]]
                  # split_data[1] == SITE NAME
                  #if original sitename exists 
      organized_by_date_data[converted_date][split_data[1]] += 1
    elsif organized_by_date_data[converted_date]["www.#{split_data[1]}"] 
      #if www version of it exists
      organized_by_date_data[converted_date]["www.#{split_data[1]}"] += 1
      
    elsif (split_data[1][0..3].downcase == 'www.' && organized_by_date_data[converted_date][split_data[1][4..-1]]) ### O(line.length)
          #if website starts with www. then we want to check if theres one without www. We also check if it starts with only www because there could be variations of that websites
          # We want to consider the case such as lol.facebook.com
        #if without www version of it exists
      organized_by_date_data[converted_date][split_data[1][4..-1]] += 1
    else 
      organized_by_date_data[converted_date][split_data[1]] = 1 
      #which ever site comes in first will determine whether itll return www.facebook.com or facebook.com
    end 
  end
  
  return organized_by_date_data
end 



def print_by_count(organized_data)
  # Overall == O(smalldatesLOGsmalldates) + O(klogk) === O(klogk)

  # sort is O(datesLOGdates) == O(smallLOGsmall) == ****O(mlogm)****
  organized_dates_only = organized_data.keys.sort
  puts "***RESULTS START***"
  puts ""

  #this is O(k), dates will be much smaller per problem prompt, could be eliminated in time analysis
  
                                                # O(n*(klogk)where n = # of dates, k is # sites of given date 
  # O(dates) #with nested O(sitenamesLOGsitenames + hit) == O(small) * O(bigLOGbig + smallHit) == overall == (bigLOGbig) == ***O(klogk)*** as bottleneck by unique urls
  organized_dates_only.each do |date_el| 
    puts date_el
    # p organized_data[date_el]
    # sort mlogm, m being unique url entries, which is way smaller than n
    # "You can assume that the cardinality (i.e. number of distinct values) of hit count values and the number of days are much smaller than the number of unique URLs."
          organized_data = {date: {sitename: hits, sitename3: hits, sitename4: hits}, date2: {sitename2: hits2}}
    hits = organized_data[date_el].sort_by {|site, hits| -hits}
    # hits = [[sitename, 5], [sitename2, 1]]
    hits.each do |hit| 
      puts "#{hit[0]} #{hit[1]}"
    end
    puts ""
  end 
  puts "***RESULTS END***" 
  puts ""
end 
# organized_by_count_arr = organized_by_date_data.sort_by {|key, value| organized_by_date_arr[key]}

# p organized_by_date_data
# puts organized_by_site_data
# collected_data.each do |data| 

# end 
# print collected_data



start