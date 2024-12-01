import Foundation

//First part:

let fileURL = URL(fileURLWithPath: "./input.txt")

let fileContents = try! String(contentsOf: fileURL, encoding: .utf8)

let array = fileContents.components(separatedBy: "\n")
var firstID: [Int] = []
var secondID: [Int] = []
var totalDistance = 0

for element in array {

  let line = element.components(separatedBy: "   ")

  firstID.append(Int(line[0])!)
  secondID.append(Int(line[1])!)
}

firstID.sort()
secondID.sort()

for (index, first) in firstID.enumerated() {

  let second = secondID[index]

  let distance = abs(first - second)

  totalDistance += distance
}

print("First part solution: \(totalDistance)")

// Second part:

var result = 0

for first in firstID {
  for second in secondID {
    if first == second {
      result += first
    }
  }
}

print("Second part solution: \(result)")
