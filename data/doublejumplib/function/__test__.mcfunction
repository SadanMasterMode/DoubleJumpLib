# THIS FUNCTION IS NOT MEANT TO BE RUN MANUALLY. It is purely for testing purposes
# If you wish to test the system, add this function to the function tag listed below.
# #doublejumplib:on_double_jump.json
execute unless predicate doublejumplib:_system_installed run return run function doublejumplib:internal/_fail_command {command:'tellraw @s {text:"The system is not installed yet! Please run the doublejumplib:__install__ function before running any files.",color:"red"}'}

execute unless score $djl.running_tag djl.debug matches 1 run return run function doublejumplib:internal/_fail_command {command:'tellraw @s {text:"This function is meant to be run through the function tag #doublejumplib:on_double_jump. Please run it through this, and not through chat, functions, command blocks, or any other means.",color:"red"}'}

# Wildly laggy but its just for testing mainly
execute store result storage doublejumplib:main Pos.X int 0.0001 run data get entity @s Pos[0] 10000
execute store result storage doublejumplib:main Pos.Y int 0.0001 run data get entity @s Pos[1] 10000
execute store result storage doublejumplib:main Pos.Z int 0.0001 run data get entity @s Pos[2] 10000

tellraw @s [{text:"JUMP DETECTED: Function tag has been run! [",color:"green"},{selector:"@s",color:"green"},{text:", ",color:"green"},{"score":{name:"@s",objective:"djl.jumpCount"},color:"green"},{text:", (",color:"green"},{storage:"doublejumplib:main",nbt:"Pos.X",color:"green"},{text:", ",color:"green"},{storage:"doublejumplib:main",nbt:"Pos.Y",color:"green"},{text:", ",color:"green"},{storage:"doublejumplib:main",nbt:"Pos.Z",color:"green"},{text:")]",color:"green"},]