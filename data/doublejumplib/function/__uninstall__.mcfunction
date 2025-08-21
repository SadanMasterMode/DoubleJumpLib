execute unless predicate doublejumplib:_system_installed run return run function doublejumplib:internal/_fail_command {command:'tellraw @s {text:"The system is not installed yet! Please run the doublejumplib:__install__ function before attempting to uninstall the system.",color:"red"}'}

tellraw @s {text:"Uninstalling DoubleJumpLib... this may take a short time.",color:"green"}

# Reset scoreboards
scoreboard players reset * djl.prevJump
scoreboard players reset * djl.prevOnGround
scoreboard players reset * djl.jumpCount
scoreboard players reset $djl.success djl.debug
scoreboard players reset $djl.running_tag djl.debug
scoreboard players reset $djl.enabled djl.debug

# Remove scoreboards
scoreboard objectives remove djl.prevJump
scoreboard objectives remove djl.prevOnGround
scoreboard objectives remove djl.jumpCount
scoreboard objectives remove djl.debug

# Remove storage
data remove storage doublejumplib:main Pos

tellraw @s {text:"Successfully uninstalled DoubleJumpLib!",color:"green"}