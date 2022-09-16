//
//  LaunchViewController.swift
//  MoviesAPIs
//
//  Created by Abdullah Elbokl on 16/09/2022.
//

import UIKit
import Alamofire

// Data Base
//var trendingMovies: [MovieModel] = []
//var popular: [MovieModel] = []
//var upcoming: [MovieModel] = []
//var TopRated: [MovieModel] = []

var dataBase: [DataByTitle] = [
    DataByTitle(title: "Trending Movies", data: []),
    DataByTitle(title: "Popular", data: []),
    DataByTitle(title: "Upcoming", data: []),
    DataByTitle(title: "TopRated", data: []),
]


class LaunchViewController: UIViewController {
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //size of loading indicator
        loadingIndicator.transform = CGAffineTransform(scaleX: 2.5, y: 2.5)
        fetchAllData()
        
    }
}

extension LaunchViewController{
    func fetchAllData(){
        // trending movies
        AF.request("https://api.themoviedb.org/3/trending/movie/day?api_key=dee923fdab6a24f73be65278f17a7d46").responseDecodable(of: MoviesModel.self) { response in
            guard let data = response.value else {return}
            dataBase[0].data = data.results
            self.ifAllFinished()
        }
        //popular
        AF.request("https://api.themoviedb.org/3/movie/popular?api_key=dee923fdab6a24f73be65278f17a7d46&language=en-US&page=1").responseDecodable(of: MoviesModel.self) { response in
            guard let data = response.value else {return}
            dataBase[1].data = data.results
            self.ifAllFinished()
        }
        //upcoming
        AF.request("https://api.themoviedb.org/3/movie/upcoming?api_key=dee923fdab6a24f73be65278f17a7d46&language=en-US&page=1").responseDecodable(of: MoviesModel.self) { response in
            guard let data = response.value else {return}
            dataBase[2].data = data.results
            self.ifAllFinished()
        }
        //TopRated
        AF.request("https://api.themoviedb.org/3/movie/top_rated?api_key=dee923fdab6a24f73be65278f17a7d46&language=en-US&page=1").responseDecodable(of: MoviesModel.self) { response in
            guard let data = response.value else {return}
            dataBase[3].data = data.results
            self.ifAllFinished()
        }
    }


    func ifAllFinished(){
        if !dataBase[0].data.isEmpty &&
            !dataBase[1].data.isEmpty &&
            !dataBase[2].data.isEmpty &&
            !dataBase[3].data.isEmpty{

            loadingIndicator.stopAnimating()

            guard let homeVC = storyboard?.instantiateViewController(withIdentifier: "HomeNavigationController") else {return}
            present(homeVC, animated: true)
        }
    }

}




//extension LaunchViewController{
//    func fetchAllData(){
//        // trending movies
//        AF.request("https://api.themoviedb.org/3/trending/movie/day?api_key=dee923fdab6a24f73be65278f17a7d46").responseDecodable(of: MoviesModel.self) { response in
//            guard let data = response.value else {return}
//            trendingMovies = data.results
//            self.ifAllFinished()
//        }
//        //popular
//        AF.request("https://api.themoviedb.org/3/movie/popular?api_key=dee923fdab6a24f73be65278f17a7d46&language=en-US&page=1").responseDecodable(of: MoviesModel.self) { response in
//            guard let data = response.value else {return}
//            popular = data.results
//            self.ifAllFinished()
//        }
//        //upcoming
//        AF.request("https://api.themoviedb.org/3/movie/upcoming?api_key=dee923fdab6a24f73be65278f17a7d46&language=en-US&page=1").responseDecodable(of: MoviesModel.self) { response in
//            guard let data = response.value else {return}
//            upcoming = data.results
//            self.ifAllFinished()
//        }
//        //TopRated
//        AF.request("https://api.themoviedb.org/3/movie/top_rated?api_key=dee923fdab6a24f73be65278f17a7d46&language=en-US&page=1").responseDecodable(of: MoviesModel.self) { response in
//            guard let data = response.value else {return}
//            TopRated = data.results
//            self.ifAllFinished()
//        }
//    }
//
//
//    func ifAllFinished(){
//        if !trendingMovies.isEmpty &&
//            !popular.isEmpty &&
//            !upcoming.isEmpty &&
//            !TopRated.isEmpty{
//
//            loadingIndicator.stopAnimating()
//
//            guard let homeVC = storyboard?.instantiateViewController(withIdentifier: "HomeNavigationController") else {return}
//            present(homeVC, animated: true)
//        }
//    }
//
//}
