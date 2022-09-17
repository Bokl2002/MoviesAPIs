//
//  Model.swift
//  MoviesAPIs
//
//  Created by Abdullah Elbokl on 16/09/2022.
//

import Foundation

let api_key = "dee923fdab6a24f73be65278f17a7d46"
let baseURL = "https://api.themoviedb.org/3"

struct MovieModel: Decodable{
    var title: String?
    var poster_path: String?
}

struct MoviesModel: Decodable{
    var results: [MovieModel]
}

struct DataByTitle{
    var title: String
    var data: [MovieModel]
}
