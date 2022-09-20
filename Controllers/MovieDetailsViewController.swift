//
//  MovieDetailsViewController.swift
//  MoviesAPIs
//
//  Created by Abdullah Elbokl on 18/09/2022.
//

import UIKit
import WebKit
import Alamofire
import CoreData

class MovieDetailsViewController: UIViewController, WKNavigationDelegate {
    
    // global variables
    var detailsData: MovieModel!

    // outlets
    @IBOutlet weak var youtubeWebView: WKWebView!
    @IBOutlet weak var movieOverViewTextView: UITextView!
    @IBOutlet weak var favouritBTN: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showDetails()

    }
    override func viewWillAppear(_ animated: Bool) {
        someConfigurations()
    }

    func showDetails(){
        // title
        self.title = detailsData.title
        
        // overview
        movieOverViewTextView.text = detailsData.overview
////        web View
//        let title = "\(detailsData.title) trailer".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
//        AF.request("\(Constants.youtube_baseURL)q=\(title)&key=\(Constants.youtube_key)").responseDecodable(of: YsModels.self) { response in
//            guard let data = response.value?.items else {return}
//            guard let videoID = data.first?.id.videoId else {return}
//            
//            guard let url = URL(string: "https://www.youtube.com/embed/\(videoID)") else {return}
//            self.youtubeWebView.load(URLRequest(url: url))
//        }
    }
    
    func someConfigurations(){
        youtubeWebView.allowsBackForwardNavigationGestures = true
        // favourit button
        if isFavourit[detailsData.id] == true{
            favouritBTN.image = UIImage(systemName: "heart.fill")
        }else{
            favouritBTN.image = UIImage(systemName: "heart")
        }
    }
    

    @IBAction func favouritBTN(_ sender: Any) {
        
        if isFavourit[detailsData.id] != true{
            // add to favourit
            favouritBTN.image = UIImage(systemName: "heart.fill")
            isFavourit[detailsData.id] = true
            favouritsDataBase.append(detailsData)
            coreData.newFavouritCoreData(detailsData)
            
        }else{
            // remove from favourit
            favouritBTN.image = UIImage(systemName: "heart")
            isFavourit[detailsData.id] = false
            for i in 0..<favouritsDataBase.count{
                if favouritsDataBase[i].id == detailsData.id{
                    favouritsDataBase.remove(at: i)
                    coreData.deleteFromCoreData(detailsData)
                    break
                }
            }
        }
        
    }
    
}


