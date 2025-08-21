execute as @a[predicate=!__base__code__:on_ground] unless score @s prevOnGround matches 0 run function __base__code__:on_ground_trigger

scoreboard players set @a[predicate=!__base__code__:is_jumping,scores={prevJump=1}] prevJump 0

execute as @a[predicate=__base__code__:is_jumping,predicate=!__base__code__:on_ground,tag=!doubleJumped] at @s if score @s prevJump matches 0 run function __base__code__:main
tag @a[predicate=__base__code__:on_ground,tag=doubleJumped] remove doubleJumped

scoreboard players set @a[predicate=__base__code__:on_ground] prevOnGround 1