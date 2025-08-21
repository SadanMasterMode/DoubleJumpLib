# DoubleJumpLib
A simple Minecraft datapack library which has double jump detection for Minecraft 1.21.8+
Modrinth: coming soon...

For any errors, troubleshooting or help, please contact @sadanmastermode on Discord, or open an issue request on GitHub

## Features
 - Automatically detects when the user presses space midair, and activates a function tag.
 - Makes sure the user first releases and then presses space after the initial jump so that nothing is called on the initial jump input.
 - Supports unlimited midair space inputs, though is defaulted at a max of 1 every jump.
 - Easily configurable with a lot of error handling through the pack
 - Multiplayer compatible
 - Very simple to uninstall, removing all scoreboards and storages through a single function call.
 - Stripped-down code for double-jump detection is included too under the `__base_code__` namespace

## Documentation
### Downloading
To download the pack, you can click on the latest release on the right. This will download the pack. Once downloaded, you can unzip it and put it in your datapacks folder in your world folder to import the library.

Note that the pack has only been tested in 1.21.8 and higher. This pack may break in lower versions, please exercise caution

### Installing
When the pack is in your world, you **must** run /function doublejumplib:\_\_install\_\_. This will properly set up all scoreboards and configs in the pack.
If you try to run functions without installing the pack, errors will come up and the pack won't run correctly.

### Adding a callback
DoubleJumpLib can be configured by setting a variety of API endpoints to values you wish. These endpoints are denoted by a pair of underscores around the name, like `__install__` or `__help__`. Do not intentionally run any functions without the pair of double underscores.

One such example of an API endpoint is the function callback. This pack will call a function tag when it detects a user has pressed a jump input in the air. The function tag is located at `#doublejumplib:__on_double_jump__`, and the relative path would be found at `doublejumplib/tags/function/__on_double_jump__.json`. Add a function from your pack into this tag to allow the pack to run it.

Inside of a callback function, the executor and position is set to the player who double-jumped. Additionally, to find the current double-jump number (how many times they've double-jumped in the current jump), it is set the player's `djl.jumpCount` score.

For example, to check if the player has double-jumped twice in the current jump, you can use: `execute if score @s djl.jumpCount matches 2 run say I jumped twice!`.

To test if the pack was installed correctly, you can try adding `doublejumplib:__test__` to the function tag. If you properly installed everything, then jumping midair will send a tellraw message in chat giving some info about the jump. Do not run this function from chat, it is intended to be ran through the function tag.

### Configuring the library
There are 2 main variables you can change, via scoreboards:
|   Playername   |   Objective   |   Function   |   Default   |
| -------------- | ------------- | ------------ | ----------- |
| $djl.maxJumps  | djl.jumpCount | Manages how many double-jumps the player can perform in a single jump before touching the ground | 1 |
| $djl.enabled   | djl.debug     | Manages whether the pack is ticking, and therefor whether the pack is enabled.  | 1 (enabled) |

These are **global settings**, meaning any other pack using DoubleJumpLib will use these same settings too.
#### IMPORTANT:
To maintain compatibility across packs, it is recommended to add checks for the player's current `djl.jumpCount` to see what jump the player is on, in case another pack increases the limit. 

For example, if your pack is intended to only activate once in a jump and gives the player a boost of upwards momentum via the `gravity` attribute, and another pack increases the `djl.maxJumps` limit to 3, then your pack will not work as intended. It is crucial in your pack to check if the player is on their first double-jump of the current jump via `execute if score @s djl.jumpCount matches 1` before inversing their gravity, unless want the other pack to allow the player to defy gravity 3 times a jump instead of 1.

There are 4 main callable function endpoints you can use.
| Function Name | Use |
| ------------- | --- |
| `__help__` | Displays the link to the README here. |
| ` __install__` | Installs the library to the world by setting up the scoreboards and all. |
| `__uninstall__` | Uninstalls the library by removing all the scoreboards and storages that were made. |
| `__test__` | Intended to be used in the function tag, this is a simple testing file to make sure the library works. |

## Adding the library to your pack
To add the library to your pack, simply copy-paste the `doublejumplib` namespace into your `data` folder. Make sure you also add the following entry into the `tick.json` under the `minecraft/tags/function` directory: `"doublejumplib:internal/_tick"`
This pack is under the MIT license, which means theres almost no restrictions. It would be very much appreciated for proper credit if you do use this in your pack.

If you do want to use the main logic of this pack without all the library-slop, there is the `__base_code__` namespace which holds a README.md containing info about the contents of this namespace. It mostly just contains the stripped-down code for a double-jump detection for you to implement.

## How does it work?
This uses the 'new' `input` predicate for the `type_specific` predicate, as well as the `on_ground` flag.

The main logic is as follows. You can 'tag' the player when they're first off the ground (using the `on_ground` flag) and untag them when they land on the ground. Also tag them whenever they're holding space (and of course remove it when they're not)

Assuming the player has both tags (is off the ground and is holding jump), then check for some things in the previous tick:
 - If they were both off the ground and NOT holding jump, then they double jumped (this is because they released the jump input after jumping first)
 - If they were off the ground and holding jump, then you don't do anything (this could be the original input for jumping)
 - And of course if they weren't doing anything (not off the ground and not holding space) then they just started jumping and you don't need to do anything

This is the basic thinking for the pack. The implementation was a bit different, though I tried to document most of it and keep it all readable. I can always explain this more if you contact me directly.

## Contributing
Although this is a very very simple library, I am always welcome to contribution. Whether it be optimizations or logic improvements, please feel free to open a pull request or contact me on Discord about this library.

## License
As per the MIT License, you are allowed to redistribute, modify and use DoubleJumpLib as long as I am credited for the original work.
