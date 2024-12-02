import Foundation

let fileURL = URL(fileURLWithPath: "./input.txt")
let fileContents = try! String(contentsOf: fileURL, encoding: .utf8)
let array = fileContents.components(separatedBy: "\n")

var safeCount = 0

for element in array {
  let line = element.components(separatedBy: " ")
  let index = line.count - 1
  var lastValue: Int = Int(line[0])!
  var asc = 0
  var desc = 0
  var safeStepCount = 0
  var removedLevel = false
  var wrongIndex: Int = 0
  var step = 0

  // First pass to check for the sequence and detect if it's valid
  for i in 1...index {
    let currentValue = Int(line[i])!
    step = abs(currentValue - lastValue)

    // Check if the sequence is valid
    if currentValue > lastValue {
      asc += 1
    } else if currentValue < lastValue {
      desc += 1
    } else {
      // Identical value detected, mark it for removal
      if !removedLevel {
        wrongIndex = i
        removedLevel = true
      }
    }

    // Check if the difference between adjacent levels is within range [1, 3]
    if step < 1 || step > 3 {
      if !removedLevel {
        wrongIndex = i
        removedLevel = true
      }
    }

    // Count safe steps if the difference is valid
    if step >= 1 && step <= 3 {
      safeStepCount += 1
    }

    lastValue = currentValue

    if removedLevel {
      break
    }
  }

  // If no bad level is detected, check if the sequence is strictly increasing or decreasing
  if !removedLevel {
    if asc == index || desc == index, safeStepCount == index {
      safeCount += 1
    }
  } else {
    // Remove the bad level and check again
    var line2 = element.components(separatedBy: " ")
    line2.remove(at: wrongIndex)

    var lastValue2 = Int(line2[0])!
    asc = 0
    desc = 0
    safeStepCount = 0

    // Re-check the sequence after removal
    for i in 1..<line2.count {
      let currentValue = Int(line2[i])!
      step = abs(currentValue - lastValue2)

      // Check ascending/descending sequence
      if currentValue > lastValue2 {
        asc += 1
      } else if currentValue < lastValue2 {
        desc += 1
      }

      // Count safe steps after removal
      if step >= 1 && step <= 3 {
        safeStepCount += 1
      }

      lastValue2 = currentValue
    }

    // After removal, check if the sequence is strictly increasing or decreasing
    if (asc == line2.count - 1 || desc == line2.count - 1) && safeStepCount == line2.count - 1 {
      safeCount += 1
    }
  }
}

print("There are \(safeCount) safe reports")
