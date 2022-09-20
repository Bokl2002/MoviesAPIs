//
//  LaunchViewController.swift
//  MoviesAPIs
//
//  Created by Abdullah Elbokl on 16/09/2022.
//
import Foundation
import UIKit
import Alamofire


class LoadingViewController: UIViewController {
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        someConfigurations()
        fetchAllData()  // -> extensions
        coreData.fetchingFromCoreData()
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        noConnectionAlert() // -> extensions
        
    }
    
    func someConfigurations(){
        loadingIndicator.transform = CGAffineTransform(scaleX: 2.5, y: 2.5)
    }
    
}

