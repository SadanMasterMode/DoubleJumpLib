# Called when the user presses space midair
tag @s add doubleJumped

# Some testing stuff to make it actually double-jump (used the bookshelf schedule library- you'd need to implement your own way of setting the gravity back to normal, which is 0.08)
attribute @s gravity base set -0.08
function #bs.schedule:schedule {run: "attribute @s gravity base set 0.08", with:{id:{type:"double_jump_gravity"},time:6,unit:"tick"}}