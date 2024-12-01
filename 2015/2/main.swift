import Foundation

let fileURL = URL(fileURLWithPath: "./input.txt")  //Specifies the URL of the file

let fileContents = try! String(contentsOf: fileURL, encoding: .utf8)  //Loads the values from the file into fileContents

let inputArray = fileContents.components(separatedBy: "\n")  //creates an array and loads the values from the file, each line gets an element

var totalArea = 0
var totalRibon = 0

for input in inputArray {

  let sides = input.components(separatedBy: "x")

  let a = Int(sides[0])!
  let b = Int(sides[1])!
  let c = Int(sides[2])!

  totalArea += (2 * (a * b + b * c + a * c) + min((a * b), (b * c), (a * c)))  //Part one
  totalRibon += (min((2 * a + 2 * b), (2 * b + 2 * c), (2 * a + 2 * c)) + (a * b * c))  //Part two

}

print("We need \(totalArea) sqft. of wrapping paper.")
print("We need \(totalRibon) ft. of ribbon.")
