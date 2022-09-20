//
//  FavouritMoviesViewController.swift
//  MoviesAPIs
//
//  Created by Abdullah Elbokl on 20/09/2022.
//

import UIKit
import Kingfisher

class FavouritMoviesViewController: UIViewController {

    @IBOutlet weak var favouritListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favouritListTableView.delegate = self
        favouritListTableView.dataSource = self        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        favouritListTableView.reloadData()
    }
    

}



extension FavouritMoviesViewController: UITableViewDelegate, UITableViewDataSource{
    
    // sections
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favouritsDataBase.count
    }
    
    // cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let idx = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavouritMoviecell", for: indexPath) as! FavouritMoviecellTableViewCell
        // image
        if let path = favouritsDataBase[idx].poster_path{
            let url = "https://image.tmdb.org/t/p/w500\(path)"
            cell.favouritMovieImage.kf.setImage(with: URL(string: url))
        }
        // title
        cell.favouritMovieTitleLabel.text = favouritsDataBase[idx].title
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let VC = storyboard?.instantiateViewController(withIdentifier: "MovieDetailsVC") as! MovieDetailsViewController
        VC.detailsData = favouritsDataBase[indexPath.row]
        navigationController?.pushViewController(VC, animated: true)
    }
    
}
