# Time Complexity is: O(l*m) 
# where l is the number of lines
# where m is site name length
def parse_by_date(file_name)
  organized_by_date_hash = Hash.new { |h, k| h[k] = {} }
  
  File.open(file_name).each do |line| 
    file_line = line
    file_line.delete!("\n") 
    date_to_site_name = file_line.split("|")
    
    epoch_time = date_to_site_name[0].to_i
    site_name = date_to_site_name[1]
    converted_date = convert_to_date(epoch_time)
    

    data_of_day = organized_by_date_hash[converted_date]
    has_www = site_name[0..3].downcase == 'www'
     
    if data_of_day[site_name]
      data_of_day[site_name] += 1
    elsif data_of_day["www.#{site_name}"] 
      data_of_day["www.#{site_name}"] += 1
    elsif (has_www && data_of_day[site_name[4..-1]]) 
      data_of_day[site_name[4..-1]] += 1
    else 
      data_of_day[site_name] = 1 
    end 

  end
  
  return organized_by_date_hash
end 

def convert_to_date(epoch_time) 
  Time.at(epoch_time).utc.strftime("%m/%d/%Y GMT")
end 
