package day2

import "core:fmt"
import "core:strings"
import "core:strconv"
import "core:math"

main :: proc() {
    input_data := #load("input.txt")
    input := string(input_data)

    safe_reports: int = 0
    for line in strings.split_lines_iterator(&input) {
        levels := strings.split_after(line, " ")

        safe: bool = true
        increasing: bool
        started: bool

        for i in 0..<len(levels) - 1 {
            n1 := strconv.atoi(levels[i])
            n2 := strconv.atoi(levels[i + 1])

            // Is increasing or decreasing
            if n1 < n2 {
                if started && !increasing {
                    safe = false
                    break
                }
                increasing = true
            } else if n1 > n2 {
                if started && increasing {
                    safe = false
                    break
                }
                increasing = false
            } else {
                safe = false
                break
            }

            if math.abs(n1 - n2) > 3 {
                safe = false
                break
            }


            if i == 0 {
                started = true
            }
        }
        safe_reports += int(safe)
    }

    fmt.println(safe_reports)

}