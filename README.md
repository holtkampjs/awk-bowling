# AWK Bowling

![Tests](https://github.com/holtkampjs/awk-bowling/actions/workflows/main.yml/badge.svg)

This is an implementation of the [Bowling Kata](https://codingdojo.org/kata/Bowling/) in [AWK](https://en.wikipedia.org/wiki/AWK).

## Testing

To run the test suite located in the `tests/` directory, simply run:

```bash
make test
```

This executes the test script located at `scripts/test` iterating over the files in the `tests/` directory evaluating each test case for its expected score.

Tests are written in the format of:

```txt
-- -- -- -- -- -- -- -- -- ---,0
81 7/ 54 X  62 9/ 63 X  72 XX6,138
```

- A test case consists of a bowling game and expected score separated by a comma
- The bowling game is 10 space separated frames
- The first 9 frames all have 2 slots dedicated to the rolls
- The 10th frame has 3 slots
- In the case of a strike (`X`), the first 9 frames replace the second slot with a space. In the 10th frame, the throws simply fill each slot.
- When no pins are knocked down, it is represented by a dash (`-`)
- Spares are represented by the number of pins knocked down in the first slot followed by a slash (`/`) representing the rest of the pins have been knocked down

## Installation

To install the script to your `~/.local/bin` directory, run:

```bash
make install
```

### Uninstall

Run:

```bash
make uninstall
```

## Usage

This script is not designed for pretty output. At some point, I may add an option for more useful display.

### Interactive

In interactive mode, the script will read from STDIN and print the result.

```bash
$ bowling
-- 7/ X  5/ 2- -- -- -- -- ---
54
81 7/ 54 X  62 9/ 63 X  72 XX6
138
```

### One off

In one-off mode, you can pipe a bowling game into the script and the output will be printed.

```bash
$ echo 'X  1/ 2- -- -- -- -- -- -- ---' | bowling
34

# or

$ bowling <<< 'X  1/ 2- -- -- -- -- -- -- ---' 
34
```

### File

Any file of test cases can be passed to the script and the result of each game will be printed in order

```bash
$ bowling ./tests/simple.txt
0
20
40
9
```
