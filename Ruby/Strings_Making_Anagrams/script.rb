#!/bin/ruby


def runCompare(a1, a2)
    # create a reference to the characters we know will be in any input
    alpha="abcdefghijklmnopqrstuvwxyz";
    # create arrays to track character frequencey counts
    freq1 = Array.new(26, 0)
    freq2 = Array.new(26, 0)
    # get lengths
    alphaLength = alpha.chars.length
    a1l = a1.chars.length
    a2l = a2.chars.length

    # loop through the alphabet
    (0...alphaLength).each do |i|
       # loop input 1
       (0...a1l).each do |j|
           # increment freqency of letters
           freq1[i] += 1 if a1[j].chr == alpha[i].chr
       end
        # loop input 2
       (0...a2l).each do |k|
            # increment freqency of letters
           freq2[i] += 1 if a2[k].chr == alpha[i].chr
       end
    end
    #create a var for final count
    finalCount = 0
    (0...alphaLength).each do |l|
         # find the difference in frequencies
         finalCount += (freq1[l] - freq2[l]).abs
    end
    # send output
    puts finalCount
end

a = gets.strip
b = gets.strip
runCompare(a,b)
