night_shifts = ["josh", "andrew", "sal", "casey", "beth", "ilana", "lauren", "sal", "casey", "casey", "nate", "beth", "nate", "nate", "casey", "casey", "casey", "andrew"]

shift_hash = night_shifts.group_by{|name| night_shifts.count(name)}

shift_hash.each_value{|value|value.uniq!}

sorted_shift_hash = {}

shift_hash.each{|k, v| v.each{|v| sorted_shift_hash[v] = k}}

p sorted_shift_hash

sorted_shift_hash.sort_by{|k, v| v}.each do |item|
  if item[1] == 1
    puts "#{item[0]} worked #{item[1]} night shift"
  else
    puts "#{item[0]} worked #{item[1]} night shifts"
  end
end


