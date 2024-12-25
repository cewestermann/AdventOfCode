package day1

import "core:strings"
import "core:fmt"
import "core:strconv"

occurences: [99999]u8

main :: proc() {
    input_data := #load("input.txt")
    input := string(input_data)

    for line in strings.split_lines_iterator(&input) {
        second_num := strconv.atoi(line[8:])
        occurences[second_num] += 1
    }

    input = string(input_data)

    total: int
    for line in strings.split_lines_iterator(&input) {
        first_num := strconv.atoi(line[:5])
        total += int(occurences[first_num]) * first_num
    }

    fmt.println(total)
}