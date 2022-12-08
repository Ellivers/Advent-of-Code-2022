# The main loop

data modify storage day7:storage root.temp set from storage day7:storage root.dirs[0]

data remove storage day7:storage root.dirs[0][0]
execute store success score $temp day7 unless data storage day7:storage root.dirs[0][0]
execute unless data storage day7:storage root.dirs[0][0] run data remove storage day7:storage root.dirs[0]

execute if data storage day7:storage root.temp[0].contents run data modify storage day7:storage root.dirs append from storage day7:storage root.temp[0].contents
execute store result score $size day7 run data get storage day7:storage root.temp[0].size
scoreboard players operation $currentSize day7 += $size day7

execute if score $temp day7 matches 1 if score $currentSize day7 matches ..100000 run scoreboard players operation $totalSize day7 += $currentSize day7
execute if score $temp day7 matches 1 unless score $currentSize day7 matches ..100000 run scoreboard players set $currentSize day7 0

execute if data storage day7:storage root.dirs[0] run function day7:loop
