//
//  Global.swift
//  MoviesAPIs
//
//  Created by Abdullah Elbokl on 17/09/2022.
//

import Foundation

// data base
var dataBase: [DataByTitle] = [
    DataByTitle(title: "Trending Movies", data: []),
    DataByTitle(title: "Popular", data: []),
    DataByTitle(title: "Upcoming", data: []),
    DataByTitle(title: "TopRated", data: []),
]
var favouritsDataBase: [MovieModel] = []
var isFavourit: [Int: Bool] = [:]



struct Constants{
    static let api_key = "dee923fdab6a24f73be65278f17a7d46"
    static let baseURL = "https://api.themoviedb.org/3"
    static let youtube_key = "AIzaSyBpyIsrvY0kzhxWIK9bkcSSqGWfD-Pvw9M"
    static let youtube_baseURL = "https://youtube.googleapis.com/youtube/v3/search?"
    
}

protocol NavDelegate: AnyObject{
    func cellTapped()
}

