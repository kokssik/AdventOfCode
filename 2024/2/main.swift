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
  var removedLevel = false
  var wrongIndex: Int = 0

  for i in 1...index {
    if Int(line[i])! > lastValue {
      asc += 1
      step = Int(line[i])! - lastValue
      if !removedLevel && desc > 0 {
        wrongIndex = i
        removedLevel = true
      }
    } else if Int(line[i])! < lastValue {
      desc += 1
      step = lastValue - Int(line[i])!
      if !removedLevel && asc > 0 {
        wrongIndex = i
        removedLevel = true
      }
    } else {
      if !removedLevel {
        wrongIndex = i
        removedLevel = true
      }
    }

    if step < 4 {
      safeStepCount += 1
    } else if (step > 3) && !removedLevel {
      wrongIndex = i
      removedLevel = true
    }

    if removedLevel { break }

    lastValue = Int(line[i])!
  }

  if !removedLevel {
    if asc == index || desc == index { ascOrDesc = true }
    if safeStepCount == index { maxStep = true }

    if ascOrDesc && maxStep { safeCount += 1 }
  } else {
    var line2 = element.components(separatedBy: " ")
    line2.remove(at: wrongIndex)

    let index2 = line2.count - 1
    var lastValue: Int = Int(line2[0])!
    asc = 0
    desc = 0
    safeStepCount = 0
    maxStep = false

    for i in 1...index2 {
      step = abs(Int(line2[i])! - lastValue)
      if Int(line2[i])! > lastValue {
        asc += 1
      } else if Int(line2[i])! < lastValue {
        desc += 1
      }

      if step < 4 { safeStepCount += 1 }

      lastValue = Int(line2[i])!
    }
    if asc == index2 || desc == index2 { ascOrDesc = true }
    if safeStepCount == index2 { maxStep = true }

    if ascOrDesc && maxStep { safeCount += 1 }
  }

}

print("There are \(safeCount) safe reports")
