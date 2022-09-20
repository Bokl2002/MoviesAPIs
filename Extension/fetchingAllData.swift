//
//  Extensions.swift
//  MoviesAPIs
//
//  Created by Abdullah Elbokl on 20/09/2022.
//

import Foundation
import Alamofire

extension LoadingViewController{
    func fetchAllData(){
        // trending movies
        AF.request("\(Constants.baseURL)/trending/movie/day?api_key=\(Constants.api_key)").responseDecodable(of: MoviesModel.self) { response in
            guard let data = response.value else {return}
            dataBase[0].data = data.results
            self.ifAllFinished()
        }
        //popular
        AF.request("\(Constants.baseURL)/movie/popular?api_key=\(Constants.api_key)&language=en-US&page=1").responseDecodable(of: MoviesModel.self) { response in
            guard let data = response.value else {return}
            dataBase[1].data = data.results
            self.ifAllFinished()
        }
        //upcoming
        AF.request("\(Constants.baseURL)/movie/upcoming?api_key=\(Constants.api_key)&language=en-US&page=1").responseDecodable(of: MoviesModel.self) { response in
            guard let data = response.value else {return}
            dataBase[2].data = data.results
            self.ifAllFinished()
        }
        //TopRated
        AF.request("\(Constants.baseURL)/movie/top_rated?api_key=\(Constants.api_key)&language=en-US&page=1").responseDecodable(of: MoviesModel.self) { response in
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
            
            guard let homeVC = storyboard?.instantiateViewController(withIdentifier: "tabBarController") else {return}
            present(homeVC, animated: false)
        }
    }
    
    
}
