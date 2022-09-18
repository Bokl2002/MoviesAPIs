//
//  Model.swift
//  MoviesAPIs
//
//  Created by Abdullah Elbokl on 16/09/2022.
//

import Foundation


struct MovieModel: Decodable{
    var title: String?
    var poster_path: String?
    var overview: String?
}

struct MoviesModel: Decodable{
    var results: [MovieModel]
}

struct DataByTitle{
    var title: String
    var data: [MovieModel]
}
