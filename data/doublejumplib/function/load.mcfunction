scoreboard objectives add djl.prevJump dummy
scoreboard objectives add djl.prevOnGround dummy

tellraw @a {text:"DoubleJumpLib has been successfully loaded.",hover_event:{action:"show_text",value:"Developed by @SadanMasterMode"},color:"green"}