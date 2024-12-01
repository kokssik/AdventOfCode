import Foundation

let fileURL = URL(fileURLWithPath: "./input.txt")

let fileContents = try! String(contentsOf: fileURL, encoding: .utf8)

var array = Array(repeating: Array(repeating: false, count: 1000), count: 1000)
var xs = 500
var ys = 500
var xr = 500
var yr = 500
var santa = true
var trueCount = 0

array[500][500] = true

for char in fileContents {

  if santa {
    if char == "^" {
      ys += 1
    } else if char == "v" {
      ys -= 1
    } else if char == ">" {
      xs += 1
    } else if char == "<" {
      xs -= 1
    }
    array[xs][ys] = true
  } else {
    if char == "^" {
      yr += 1
    } else if char == "v" {
      yr -= 1
    } else if char == ">" {
      xr += 1
    } else if char == "<" {
      xr -= 1
    }
    array[xr][yr] = true
  }
  santa.toggle()
}

for i in 0...999 {
  for j in 0...999 {
    if array[i][j] { trueCount += 1 }
  }
}

print(trueCount)
