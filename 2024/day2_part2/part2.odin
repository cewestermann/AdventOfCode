package day2

import "core:fmt"
import "core:strings"

main :: proc() {
    input_data := #load("input.txt")
    input := string(input_data)

    for line in strings.split_lines_iterator(&input) {
        fmt.println(line)
    }
}