# Challenge 1

## Tools needed
 - Ruby (Any version will probably work, but I am on 2.3.1)

## How to run
1. In terminal, navigate to "part1" directory
2. Run command "ruby count_data.rb input.txt" without quotation marks. (Replace input.txt with your desired txt file)

## Scenario:

You’re given an input file. Each line consists of a timestamp (unix epoch in seconds) and a url separated by ‘|’ (pipe operator). The entries are not in any chronological order. Your task is to produce a daily summarized report on url hit count, organized daily (mm/dd/yyyy GMT) with the earliest date appearing first. For each day, you should display the number of times each url is visited in the order of highest hit count to lowest count. Your program should take in one command line argument: input file name. The output should be printed to stdout. You can assume that the cardinality (i.e. number of distinct values) of hit count values and the number of days are much smaller than the number of unique URLs. You may also assume that number of unique URLs can fit in memory, but not necessarily the entire file.


input.txt

1407564301|www.nba.com<br>
1407478021|www.facebook.com<br>
1407478022|www.facebook.com<br>
1407481200|news.ycombinator.com<br>
1407478028|www.google.com<br>
1407564301|sports.yahoo.com<br>
1407564300|www.cnn.com<br>
1407564300|www.nba.com<br>
1407564300|www.nba.com<br>
1407564301|sports.yahoo.com<br>
1407478022|www.google.com<br>
1407648022|www.twitter.com<br>


Output<br>

08/08/2014 GMT<br>
www.facebook.com 2<br>
www.google.com 2 <br>
news.ycombinator.com 1 <br>

08/09/2014 GMT<br>
www.nba.com 3 <br>
sports.yahoo.com 2 <br>
www.cnn.com 1 <br>

08/10/2014 GMT <br>
www.twitter.com 1 <br>