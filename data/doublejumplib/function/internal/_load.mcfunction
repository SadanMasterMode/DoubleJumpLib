execute if predicate doublejumplib:_system_installed run return fail

# Initialize objectives
scoreboard objectives add djl.prevJump dummy
scoreboard objectives add djl.prevOnGround dummy
scoreboard objectives add djl.jumpCount dummy
scoreboard objectives add djl.debug dummy

# Set config options
execute unless score $djl.maxJumps djl.jumpCount = $djl.maxJumps djl.jumpCount run scoreboard players set $djl.maxJumps djl.jumpCount 1
execute unless score $djl.enabled djl.debug = $djl.enabled djl.debug run scoreboard players set $djl.enabled djl.debug 1

# Set the system to installed
scoreboard players set $djl.success djl.debug 1

# Return true
return 1