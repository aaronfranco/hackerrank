#!/bin/ruby
n = gets.strip.to_i
$names = []
$count = 0
$occurs = {}
def addName(data)
    i = data.length
    while i >= 0
        if data[0...i] != ""
            if $occurs[data[0...i]]
                $occurs[data[0...i]] += 1
            else
                $occurs[data[0...i]] = 1
            end
        end
        i -= 1
    end
end
def checkString(data)
   row = $names.join(' ')
   $count = row.scan(/(?=#{data})/).count
end
for a0 in (0..n-1)
    op,contact = gets.strip.split(' ')
    case op
        when "add"
            addName(contact)
        when "find"
            checkString(contact)
            if $occurs[contact]
                puts $occurs[contact]
            else
                puts 0
            end
    else
        puts "bad input"
    end

end
