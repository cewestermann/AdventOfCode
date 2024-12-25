package day1

import "core:os"
import "core:math"
import "core:strings"
import "core:slice"
import "core:fmt"
import "core:strconv"

read_file_line_by_line :: proc(filepath: string) {
    data, ok := os.read_entire_file(filepath, context.allocator)

    if !ok {
        return
    }

    defer delete(data, context.allocator)

    it := string(data)

    left: [1000]int
    right: [1000]int

    idx: u32 = 0

    for line in strings.split_lines_iterator(&it) {
        left[idx] = strconv.atoi(line[:5])
        right[idx] = strconv.atoi(line[8:])
        idx += 1
    }

    slice.sort(left[:]) // Use [:] to get a slice
    slice.sort(right[:])


    total_distance: int = 0

    for i in 0..<len(left) {
        total_distance += math.abs(left[i] - right[i])
    }

    fmt.println(total_distance)
}

main :: proc() {
    read_file_line_by_line("part1.txt")
}