//
//  MovieDetailsViewController.swift
//  MoviesAPIs
//
//  Created by Abdullah Elbokl on 18/09/2022.
//

import UIKit
import WebKit
class MovieDetailsViewController: UIViewController {
    
    var detailsData: MovieModel!
    
    // web View
    //AF.request("\(Constants.youtube_baseURL)q=\(movieTitle)&key=\(Constants.youtube_key)").responseDecodable(of: YsModels.self) { response in
    //    guard let data = response.value else {return}
    //    print(data)
    //}
    
    var section = -1
    var idx = -1

    @IBOutlet weak var youtubeWebView: WKWebView!
    @IBOutlet weak var movieOverViewTextView: UITextView!
    @IBOutlet weak var downloadBTN: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if section == -1 {
            fromSearchingSetupVc()
        }else{
            fromCollectionSetupVC()
        }
        someConfigurations()

    }

    func fromCollectionSetupVC(){
        movieOverViewTextView.text = dataBase[section].data[idx].overview ?? ""
    }
    
    func fromSearchingSetupVc(){
        movieOverViewTextView.text = detailsData.overview
    }
    
    func someConfigurations(){
        downloadBTN.layer.cornerRadius = 20
    }
}
