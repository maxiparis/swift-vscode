func minMovesToSeat(_ seats: [Int], _ students: [Int]) -> Int {
    let sortedSeats = seats.sorted()
    let sortedStudents = students.sorted()
    var movements = 0

    for i in sortedSeats.indices {
        movements += abs(sortedStudents[i] - sortedSeats[i])
    }

    return movements
}


// -----
let seats = [2, 2, 6, 6]
let students = [1,3,2,6]
let correctResponse = 4

print(minMovesToSeat(seats, students) == correctResponse)