# FuzzyWood Nvim

## Best Nvim there is (propably)

TO-DO:

| TO-DO         |
| ------------- |
| Better Undo   |
| documentation |
| Better Look   |

## Genral

| Tag        | Action                      |
| ---------- | --------------------------- |
| h,j,k,l    | move left, down, up, right  |
| y          | yank selection              |
| p          | paste                       |
| "<a...z>   | paste from register         |
| CTRL-B     | Move up half a page         |
| CTRL-U     | Move down half a page       |
| SPACE-u    | UI quickoptions             |
| SPACE-c-f  | format code                 |
| <leader>uf | Toggle Auto Format (Global) |
| <leader>uF | Toggle Auto Format (Buffer) |
| <leader>uL | Toggle Relative Line Number |

## Jumping in Page

| Tag        | Action                                        |
| ---------- | --------------------------------------------- |
| w          | jump word forward                             |
| b          | jump word backward                            |
| e          | jump to an end of a word                      |
| W          | jump WORD forward                             |
| B          | jump WORD backwards                           |
| E          | Jump to an end of a WORD                      |
| ^          | move to the first non-empty character in line |
| <leader>sj | show Jumps                                    |
| g;         | move to Previous cursor position              |
| g,         | move to Next cursor position                  |
| {          | Jump to Next blank line                       |
| }          | Jump to Previous blank line                   |
| {          | Jump to next blank line                       |

## Searching

| Tag        | Action                                   |
| ---------- | ---------------------------------------- |
| <leader>sg | grep search ()                           |
| f-<char>   | quick searches the given character       |
| F-<char>   | same as above, but backwards             |
| ;          | move forward in search result            |
| .          | move backward in search result           |
| s          | same as f but with the flash.nvim plugin |
| vS         | highlights block using flash.nvim        |

## Windows, Buffers, Tabs

| Tag            | Action                               |
| -------------- | ------------------------------------ |
| CTRL-<h,j,k,l> | Go to Window (left, down, up, right) |
| TAB            | Go to next Buffer                    |
| SHIFT-TAB      | Go to Previous Buffer                |
| <leader>bd     | Closes a Buffer                      |
| CTRL-W         | Closes a Window                      |
| CTRL-W-s       | Splits the window horizontally       |
| CTRL-W-v       | Splits the window vertically         |

## Insert, Change, Comment, Delete

| Tag            | Action                                           |
| -------------- | ------------------------------------------------ |
| {d, c, r, v}iw | (d)elete (c)hange (r)eplace (v)visual inner word |
| c{i, a}w       | change inner/outer word                          |
| dib            | deletes inner block                              |
| gco            | Add Comment Below                                |
| gcO            | Add Comment above                                |
| C              | deletes until the end of Line                    |
| gv             | restores the last visual                         |

## Telescope

| Tag         | Action                           |
| ----------- | -------------------------------- |
| SPACE-SPACE | search files (working directory) |
| SPACE-fh    | search files (Home Directory)    |
| SPACE-ff    | search files (root Directory)    |
| SPACE-fk    | search keymaps                   |
| SPACE-fc    | Search config files              |
| SPACE-fb    | Search in Buffer                 |

## LSP

| Tag        | Action                   |
| ---------- | ------------------------ |
| <leader>ss | LSP Symbols              |
| E          | Jump to an end of a WORD |

## Files

| Tag        | Action                   |
| ---------- | ------------------------ |
| <leader>cF | Rename File              |
| <leader>   | Jump to an end of a WORD |
