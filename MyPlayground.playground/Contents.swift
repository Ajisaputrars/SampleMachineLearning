import Cocoa
import CreateML

let parsingOptions = MLDataTable.ParsingOptions(containsHeader: true, delimiter: ";", selectColumns: ["UserID", "movieID", "Rating"])
let dataRec = try MLDataTable(contentsOf: URL(fileURLWithPath: "/Users/ajisaputrars/Downloads/MovieRating.csv"), options: parsingOptions)

print(dataRec)

let model = try MLRecommender(trainingData: dataRec, userColumn: "UserID", itemColumn: "movieID", ratingColumn: "Rating")

let dataTest = try MLDataTable(contentsOf: URL(fileURLWithPath: "/Users/ajisaputrars/Downloads/MovieRating.csv"), options: parsingOptions)
let metrics = model.evaluation(on: dataTest, userColumn: "UserID", itemColumn: "movieID")

let recommendation = try model.recommendations(fromUsers: ["H"])
print(recommendation)
