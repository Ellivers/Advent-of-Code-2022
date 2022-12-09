# The main loop

data modify storage day7:storage root.temp set from storage day7:storage root.dirs[0]

execute store success score $temp day7 run data remove storage day7:storage root.dirs[0].contents[0]
execute if score $temp day7 matches 0 run data remove storage day7:storage root.dirs[0]

execute if data storage day7:storage root.temp.contents[0].contents run data modify storage day7:storage root.dirs prepend from storage day7:storage root.temp.contents[0]
execute if data storage day7:storage root.temp.contents[0].contents run function day7:loop
execute store result score $size day7 run data get storage day7:storage root.temp.contents[0].size

execute store result score $currentSize day7 run data get storage day7:storage root.temp.dirsize
scoreboard players operation $currentSize day7 += $size day7
execute if score $temp day7 matches 1 store result storage day7:storage root.dirs[0].dirsize int 1 run scoreboard players get $currentSize day7

execute if score $temp day7 matches 0 if score $currentSize day7 matches ..100000 run scoreboard players operation $totalSize day7 += $currentSize day7

execute if score $temp day7 matches 0 store result score $parentSize day7 run data get storage day7:storage root.dirs[0].dirsize
execute if score $temp day7 matches 0 run scoreboard players operation $parentSize day7 += $currentSize day7
execute if score $temp day7 matches 0 store result storage day7:storage root.dirs[0].dirsize int 1 run scoreboard players get $parentSize day7

execute if data storage day7:storage root.dirs[0][0] run function day7:loop
