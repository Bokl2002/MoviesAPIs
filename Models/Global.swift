//
//  Global.swift
//  MoviesAPIs
//
//  Created by Abdullah Elbokl on 17/09/2022.
//

import Foundation


struct Constants{
    static let api_key = "dee923fdab6a24f73be65278f17a7d46"
    static let baseURL = "https://api.themoviedb.org/3"
    static let youtube_key = "AIzaSyDzRjELPRslkuqoiffyxpzyRI6h5FqIBuk"
    static let youtube_baseURL = "https://youtube.googleapis.com/youtube/v3/search?"
    
}

protocol NavDelegate: AnyObject{
    func cellTapped()
}

