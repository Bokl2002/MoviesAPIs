//
//  SearchViewController.swift
//  MoviesAPIs
//
//  Created by Abdullah Elbokl on 16/09/2022.
//

import UIKit
import Alamofire
import Kingfisher

class SearchViewController: UIViewController {
    
    var searchDataBase: [MovieModel] = []
    var filteredData: [MovieModel] = []
    
    
    let searchController = UISearchController(searchResultsController: nil)
    
    
    @IBOutlet weak var moviesSearchBar: UISearchBar!
    @IBOutlet weak var searchTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        
        searchTableView.delegate = self
        searchTableView.dataSource = self
        
        configureSearchController()
        
    }
    
    func configureSearchController(){
        moviesSearchBar.delegate = self
        searchController.searchBar.placeholder = "search for movie"
    }
    
    // discover section
    func fetchData(){
        AF.request("\(Constants.baseURL)/discover/movie?api_key=\(Constants.api_key)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate").responseDecodable(of: MoviesModel.self) { response in
            guard let data = response.value else {return}
            self.searchDataBase = data.results
            self.filteredData = self.searchDataBase
            DispatchQueue.main.async {
                self.searchTableView.reloadData()
            }
        }
    }
    
}



// MARK: Search Table View configuration
extension SearchViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    // cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchTableView.dequeueReusableCell(withIdentifier: "discoverCell") as! SearchTableViewCell
        // image
        let temp = filteredData[indexPath.row]
        let path = temp.poster_path ?? ""
        let url = "https://image.tmdb.org/t/p/w500\(path)"
        cell.searchImageView.kf.setImage(with: URL(string: url))
       // title
        cell.searchTitleLabel.text = filteredData[indexPath.row].title
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let VC = storyboard?.instantiateViewController(withIdentifier: "MovieDetailsVC") as! MovieDetailsViewController
        VC.detailsData = self.filteredData[indexPath.row]
        navigationController?.pushViewController(VC, animated: true)
    }
    
    
}

// MARK: Search Bar
extension SearchViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.trimmingCharacters(in: .whitespaces).isEmpty{
            DispatchQueue.main.async {
                self.filteredData = self.searchDataBase
                self.searchTableView.reloadData()
            }
        }else{
            //
            guard let text = searchText.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
            if text.count >= 2{
                filteredData = []
                AF.request("\(Constants.baseURL)/search/movie?api_key=\(Constants.api_key)&query=\(text)").responseDecodable(of: MoviesModel.self) { response in
                    guard let data = response.value else {return}
                    self.filteredData = []
                    self.filteredData = data.results
                    self.searchTableView.reloadData()
                }
            }
        }
    }
    
}
