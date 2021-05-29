//
//  ViewModel.swift
//  MovieApp
//
//  Created by Saneep Tomar on 2021-05-01.
//

import UIKit

let baseURL = "http://image.tmdb.org/t/p/w92"

class ViewModel: NSObject {
    var movieArr: [MovieModel] = []
    var selectedMovie: MovieModel = MovieModel(dictionary: [:])
    
    func parseJsonFile() {
        guard let url = Bundle.main.url(forResource: "movies", withExtension: "json") else { return }
        guard let data = try? Data(contentsOf: url) else { return }
        guard let jsonData = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) else { return }
        guard let jsonArray = jsonData as? [[String: Any]] else {
            return
        }
        for obj in jsonArray {
            movieArr.append(MovieModel(dictionary: obj))
        }
    }

}
