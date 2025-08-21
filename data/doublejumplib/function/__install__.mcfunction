# Run the load function and see if it succeeds
execute if function doublejumplib:internal/_load run return run tellraw @s {text:"DoubleJumpLib has been successfully installed.",hover_event:{action:"show_text",value:"Developed by @SadanMasterMode"},color:"green"}

# If it fails, try seeing if its been installed before
execute if predicate doublejumplib:_system_installed run return run function doublejumplib:internal/_fail_command {command:'tellraw @s {text:"You have already installed DoubleJumpLib!",color:"red"}'}

# If it fails, then a final error catch is released
tellraw @s {text:"There was an issue installing DoubleJumpLib. Please contact @SadanMasterMode for assistance.",color:"red"}