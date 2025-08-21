# Add to the jump count
scoreboard players add @s djl.jumpCount 1

# Make sure the player needs to unpress jump to trigger again
scoreboard players set @s djl.prevJump 1

# Run custom functions
scoreboard players set $djl.running_tag djl.debug 1
function #doublejumplib:on_double_jump
scoreboard players reset $djl.running_tag