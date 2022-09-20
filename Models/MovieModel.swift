//
//  Model.swift
//  MoviesAPIs
//
//  Created by Abdullah Elbokl on 16/09/2022.
//

import Foundation


struct MovieModel: Decodable, Equatable, Hashable{
    var title: String
    var poster_path: String?
    var overview: String?
    var id: Int
}
func ==(lhs: MovieModel, rhs: MovieModel) -> Bool{
    return lhs.title == rhs.title
}

struct MoviesModel: Decodable{
    var results: [MovieModel]
}

struct DataByTitle{
    var title: String
    var data: [MovieModel]
}
