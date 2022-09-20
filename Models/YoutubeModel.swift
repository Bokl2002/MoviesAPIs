//
//  YoutubeModel.swift
//  MoviesAPIs
//
//  Created by Abdullah Elbokl on 17/09/2022.
//

import Foundation

struct ID: Decodable{
    var videoId: String?
}

struct YModel: Decodable{
    var id: ID
}

struct YsModels: Decodable{
    var items: [YModel]
}


