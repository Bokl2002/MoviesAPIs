//
//  ViewController.swift
//  MoviesAPIs
//
//  Created by Abdullah Elbokl on 16/09/2022.
//

import UIKit

class HomeViewController: UIViewController {

    
    // outlets
    @IBOutlet weak var moviesTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
        setupApperance()

    }
    
    func setupApperance(){
        setNavBarLogo()
        
    }
    func setNavBarLogo(){
        let logo = UIImage(named: "netflix")
        let logoImageView = UIImageView(image: logo)
        logoImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = logoImageView
    }


}

// MARK: table view

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    // sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataBase.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dataBase[section].title
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        //header
        guard let header = view as? UITableViewHeaderFooterView else {return}
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        header.textLabel?.frame = header.bounds
    }
    
    
    // cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = moviesTableView.dequeueReusableCell(withIdentifier: "moviesRowCell") as! MoviesRowTableViewCell
        
        cell.moviesCollectionView.tag = indexPath.section
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = view.layer.frame.height * 0.25
        return height
    }
}

