import Foundation

//First part:

let fileURL = URL(fileURLWithPath: "./input.txt")

let fileContents = try! String(contentsOf: fileURL, encoding: .utf8)

let array = fileContents.components(separatedBy: "\n")

var niceCount = 0

for string in array {
  var vowelCount = 0
  var doubleLetter = false
  var lastLetter: Character = "\0"
  var badCombinations = false

  for letter in string {
    if letter == "a" || letter == "e" || letter == "i" || letter == "o" || letter == "u" {
      vowelCount += 1
    }

    if letter == lastLetter { doubleLetter = true }
    lastLetter = letter
  }
  if string.contains("ab") || string.contains("cd") || string.contains("pq")
    || string.contains("xy")
  {
    badCombinations = true
  }

  if vowelCount > 2 && doubleLetter && !badCombinations { niceCount += 1 }
}

print(niceCount)
