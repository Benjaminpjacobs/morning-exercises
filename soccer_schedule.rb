 require 'pry'
 
 class SoccerSchedule
   
   def combos(division)
     division.combination(2).to_a
   end

   def week(combinations)
     week = []
     week << combinations.shift
     i = 0
     until week.length == 4
        combo = combinations[i]
        week << combo unless week.flatten.include?(combo[0]) || week.flatten.include?(combo[1])
        i += 1
     end
     week
   end

   def update_combos(week, combinations)
     week.each do |match|
       combinations.delete(match)
     end
     combinations
   end

   def seven_weeks(division, i)
     schedule = {}
     combinations = combos(division)
     7.times do 
      schedule[i] = week(combinations)
      combinations = update_combos(schedule[i], combinations)
      i += 1
      end
      schedule
    end

    def schedule_division(division)
      schedule = seven_weeks(division, 1).merge(seven_weeks(division, 8))
      weekly = schedule.each_pair.map do |k, v|
        "Week#{k}: #{v}" + "\n" 
      end
      weekly.join
    end
    
    def hash_divisions(division1, division2, division3, division4)
      divisions = {}
      divisions[1] = division1
      divisions[2] = division2
      divisions[3] = division3
      divisions[4] = division4
      divisions
    end

    def generate_cross_division_combos(divisions)
      combos = []
      i = 1
      4.times do
        combos << [divisions[i].shift, divisions[i].shift]
        i+= 1
      end
      to_delete = combos.each_slice(2).to_a
      to_delete.each do |pair|
        combos.delete(pair)
      end
      combos
    end

    def cross_division_weeks(division1, division2, division3, division4)
      hash_divisions(division1, division2, division3, division4)
      cross_division_weeks = []
      4.times do 
        cross_division_weeks << generate_cross_division_combos(hash_divisions(division1, division2, division3, division4))
      end
      format_cross_divisions(cross_division_weeks).join
    end

    def format_cross_divisions(array)
      array.each_with_index.map do |array, index|
        "Week #{index+15}: #{array}\n"
      end
    end

 end

####################
d1 = %w(Crew Bulls Fire Revolution Impact Union United Raiders)
d2 = %w(Timbers Dynamo Earthquakes Rapids Galaxy Whitecaps Cowboys Bangles)
d3 = %w(Patriots Dolphins Bills Jets Steelers Ravens Browns Texans)
d4 = %w(Titans Colts Jaguars Chiefs Raiders Broncos Chargers Eagles)

planner = SoccerSchedule.new
schedule = File.new("soccer_schedule.txt", 'w')
schedule.write("Division - 1 \n" + planner.schedule_division(d1) + "\n" + 
               "Division - 2 \n" + planner.schedule_division(d2) + "\n" + 
               "Division - 3 \n" + planner.schedule_division(d3) + "\n" + 
               "Division - 4 \n" + planner.schedule_division(d4) + "\n" + 
               "Cross-Division \n" + planner.cross_division_weeks(d1, d2, d3, d4))
schedule.close