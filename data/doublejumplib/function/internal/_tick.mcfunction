execute unless predicate doublejumplib:_system_installed run return fail
execute unless score $djl.enabled djl.debug matches 1 run return fail

# If any player doesn't have a jump count, then set it to 0
execute as @a[predicate=!doublejumplib:_has_jump_count] run scoreboard players set @s djl.jumpCount 0

# If any player is off the ground and last tick they were on the ground, then they jumped
execute as @a[predicate=!doublejumplib:on_ground] unless score @s djl.prevOnGround matches 0 run function doublejumplib:internal/_on_ground_trigger

scoreboard players set @a[predicate=!doublejumplib:is_jumping,scores={djl.prevJump=1}] djl.prevJump 0

execute as @a[predicate=doublejumplib:is_jumping,predicate=!doublejumplib:on_ground] at @s if score @s djl.prevJump matches 0 if score @s djl.jumpCount < $djl.maxJumps djl.jumpCount run function doublejumplib:internal/_on_jump

execute as @a[predicate=doublejumplib:on_ground] run function doublejumplib:internal/_on_ground_predicate