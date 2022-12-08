# Call this file

#define storage day7:storage

function day7:setup

data modify storage day7:storage root.dirs set value []
data modify storage day7:storage root.dirs append from storage day7:storage root.tree
scoreboard objectives add day7 dummy
scoreboard players set $totalSize day7 0
scoreboard players set $currentSize day7 0

function day7:loop

tellraw @a {"score":{"name": "$totalSize","objective": "day7"}}
