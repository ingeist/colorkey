# ColorKey

Visualize a 33-byte compressed bitcoin public key on the command line as a sequence of 11 colors, in any True color-capable (24-bit color) terminal emulator

Motivation: by splitting the 33 bytes into 11 groups of 3 bytes; we can represent each 3-byte grouping as the corresponding hex color for quick visual analysis

while this may be tangentially helpful for quickly checking your keys in case of clipboard malware, please rely on it at your own risk
 
basic usage of colorkey.sh is ./colorkey.sh <BTC KEY>
this produces the default behavior of background color + space foreground


## Output styles:
TODO default/no arguments: block-style output
-f fg: text is colored 
-f bg: background is colored, text is colored as 255-color
-f blocks: block-style output 

```
usage:  ./colorkey.sh [options] <BTC Key>
        ./colorkey.sh <BTC Key>
        ./colorkey.sh -f <fg|bg|blocks> <BTC Key>
        ./colorkey.sh -h
        options:
                -f <fg|bg|blocks>       output the key in either foreground color, background color, or as blocks (default behavior)
                -h                      show this text
```
