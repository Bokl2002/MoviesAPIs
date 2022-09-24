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
        self.view.backgroundColor = .systemBackground

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
    
    
    
    func moveToDetails(section: Int, idx: Int){
        let VC = storyboard?.instantiateViewController(withIdentifier: "MovieDetailsVC") as! MovieDetailsViewController
        VC.detailsData = dataBase[section].data[idx]
        navigationController?.pushViewController(VC, animated: true)
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
        return 12
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        //header
        guard let header = view as? UITableViewHeaderFooterView else {return}
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        header.textLabel?.frame = header.bounds
    }
    
    
    // cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = moviesTableView.dequeueReusableCell(withIdentifier: "moviesRowCell", for: indexPath) as! MoviesRowTableViewCell
        
        cell.moviesCollectionView.tag = indexPath.section
        
        // collection view cell clicked
        cell.didSelectClosure = { section, idx in
            if let section = section, let idx = idx{
                self.moveToDetails(section: section, idx: idx)
            }
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = 250
        return CGFloat(height)
    }
}

