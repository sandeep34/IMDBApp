//
//  MovieModel.swift
//  MovieApp
//
//  Created by Ruchin Somal on 2021-05-01.
//

import UIKit

class MovieModel: NSObject {
        var adult: Bool?
        var backdrop_path: String?
        var id: Int64?
        var original_language: String?
    var title: String?
    var original_title: String?
    var overview: String?
    var popularity: Double?
    var poster_path: String?
    var release_date: String?
    var video: Bool?
    var vote_average: Float?
    var vote_count: Int64?
        
        
    required public init(dictionary: [String: Any]) {
        backdrop_path = dictionary["backdrop_path"] as? String
        adult = dictionary["adult"] as? Bool
        id = dictionary["id"] as? Int64
        original_language = dictionary["original_language"] as? String
        title = dictionary["title"] as? String
        original_title = dictionary["original_title"] as? String
        overview = dictionary["overview"] as? String
        popularity = dictionary["popularity"] as? Double
        poster_path = dictionary["poster_path"] as? String
        release_date = dictionary["release_date"] as? String
        video = dictionary["video"] as? Bool
        vote_count = dictionary["vote_count"] as? Int64
        vote_average = dictionary["vote_average"] as? Float
        }
    }
