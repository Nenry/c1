#Time Complexity: O(n*klogk)
# where n is is the number of dates
# where k is the number of unique site names for that day
def print_by_count(organized_data)

  organized_dates_only = organized_data.keys.sort

  puts "***RESULTS START***"
  puts ""

  organized_dates_only.each do |date| 
    puts date
    site_to_hits = organized_data[date].sort_by {|site, hits| -hits}

    site_to_hits.each do |hit| 
      site_name = hit[0]
      total_hits = hit[1]
      puts "#{site_name} #{total_hits}"
    end

    puts ""

  end

  puts "***RESULTS END***" 
  puts ""
  
end 