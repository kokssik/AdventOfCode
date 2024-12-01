import Foundation

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

for (index,first) in firstID.enumerated() {

  let second = secondID[index]

  let distance = abs(first - second)

  totalDistance += distance
}

print(totalDistance)
