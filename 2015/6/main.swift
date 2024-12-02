import Foundation

let fileURL = URL(fileURLWithPath: "./input.txt")

let fileContents = try! String(contentsOf: fileURL, encoding: .utf8)

var array = Array(repeating: Array(repeating: false, count: 1000), count: 1000)

let inputArray = fileContents.components(separatedBy: "\n")

//Part one:
for line in inputArray {

  let line = line.replacingOccurrences(of: ",", with: " ")

  let components = line.components(separatedBy: " ")

  if components[0] == "turn" {
    if components[1] == "on" {
      for i in Int(components[2])!...Int(components[5])! {
        for j in Int(components[3])!...Int(components[6])! {
          array[i][j] = true
        }
      }
    } else {
      for i in Int(components[2])!...Int(components[5])! {
        for j in Int(components[3])!...Int(components[6])! {
          array[i][j] = false
        }
      }
    }
  } else {
    for i in Int(components[1])!...Int(components[4])! {
      for j in Int(components[2])!...Int(components[5])! {
        array[i][j].toggle()
      }
    }
  }
}

var trueCount = 0

for i in 0...999 {
  for j in 0...999 {
    if array[i][j] { trueCount += 1 }
  }
}

print("The number of lights that are on is: \(trueCount)")

//Part two:

var arrayInt = Array(repeating: Array(repeating: 0, count: 1000), count: 1000)

for line in inputArray {

  let line = line.replacingOccurrences(of: ",", with: " ")

  let components = line.components(separatedBy: " ")

  if components[0] == "turn" {
    if components[1] == "on" {
      for i in Int(components[2])!...Int(components[5])! {
        for j in Int(components[3])!...Int(components[6])! {
          arrayInt[i][j] += 1
        }
      }
    } else {
      for i in Int(components[2])!...Int(components[5])! {
        for j in Int(components[3])!...Int(components[6])! {
          if arrayInt[i][j] > 0 {
            arrayInt[i][j] -= 1
          }
        }
      }
    }
  } else {
    for i in Int(components[1])!...Int(components[4])! {
      for j in Int(components[2])!...Int(components[5])! {
        arrayInt[i][j] += 2
      }
    }
  }
}

var totalBrightness = 0

for i in 0...999 {
  for j in 0...999 {
    totalBrightness += arrayInt[i][j]
  }
}

print("The total brightness is: \(totalBrightness)")
