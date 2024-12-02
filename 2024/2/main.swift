import Foundation

let fileURL = URL(fileURLWithPath: "./input.txt")

let fileContents = try! String(contentsOf: fileURL, encoding: .utf8)

let array = fileContents.components(separatedBy: "\n")

var safeCount = 0

for element in array {

  let line = element.components(separatedBy: " ")
  let index = (line.count - 1)
  var lastValue: Int = Int(line[0])!
  var asc = 0
  var desc = 0
  var ascOrDesc = false
  var maxStep = false
  var step = 0
  var safeStepCount = 0

  for i in 1...index {
    if Int(line[i])! > lastValue {
      asc += 1
      step = Int(line[i])! - lastValue
    } else if Int(line[i])! < lastValue {
      desc += 1
      step = lastValue - Int(line[i])!
    }

    if step < 4 { safeStepCount += 1 }

    lastValue = Int(line[i])!
  }

  if asc == index || desc == index { ascOrDesc = true }
  if safeStepCount == index { maxStep = true }

  if ascOrDesc && maxStep { safeCount += 1 }

}

print("There are \(safeCount) safe reports")
