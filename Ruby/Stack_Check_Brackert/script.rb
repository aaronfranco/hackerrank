#!/bin/ruby
t = gets.strip.to_i
for a0 in (0..t-1)
    # hash to check bracket closure
    b = { "{"=>"}", "["=>"]","("=>")" }
    expression = gets.strip
    # keep track of open/closed
    tracker = []
    # loop through the current expression
    (0...expression.length).each do |i|
      # push the first item
       if tracker.length == 0
           tracker.push(expression[i])
       else
         # check if we have a opening bracket in our last tracked bracket
           if b.key?(tracker[tracker.length-1])
             # if we do, and our current bracket closes
               if expression[i] == b[tracker[tracker.length-1]]
                 # remove last item from array
                   tracker.pop()
               else
                 # if not, push our bracke into the array
                   tracker.push(expression[i])
               end
           end
       end
    end
    # based on the above logic, if the array is not empty, it fails the test
    if tracker.length == 0
        puts "YES"
    else
        puts "NO"
