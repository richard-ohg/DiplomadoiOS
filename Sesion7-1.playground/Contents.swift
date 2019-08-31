import UIKit
import PlaygroundSupport

struct Results: Codable{
    var resultCount: Int
    var results: [Tracks]
}

struct Tracks: Codable{
    var trackName: String

}

let url = URL(string: "https://itunes.apple.com/search?term=metallica")

// * singleton -> clase más parte estática
// data -> datos que retorna
// response -> codigo de respuesta
// error -> si existe algun error
let task = URLSession.shared.dataTask(with: url!){
    (data, response, error) in
    
    let jsonDecoder = JSONDecoder()
//    print(data)
    if let data = data, let results = try? jsonDecoder.decode(Results.self, from: data){
        for track in results.results {
            print(track.trackName)
        }
    }
}

task.resume()

// Para que se quedara ejecutando el playground
PlaygroundPage.current.needsIndefiniteExecution = true

