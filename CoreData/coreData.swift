//
//  coreData.swift
//  MoviesAPIs
//
//  Created by Abdullah Elbokl on 20/09/2022.
//

import Foundation
import CoreData

struct coreData{
    
    // insert
    static func newFavouritCoreData(_ detailsData: MovieModel){
        let entity = NSEntityDescription.entity(forEntityName: "Movies", in: Context)
        //    let newMovie = NSManagedObject(context: Context)
        let newMovie = NSManagedObject(entity: entity!, insertInto: Context)
        newMovie.setValue(detailsData.title, forKey: "title")
        newMovie.setValue(detailsData.poster_path, forKey: "poster_path")
        newMovie.setValue(detailsData.overview, forKey: "overview")
        newMovie.setValue(detailsData.id, forKey: "id")
        newMovie.setValue(true, forKey: "isFavourit")
        do {
            try Context.save()
        } catch{
            print(error)
        }
    }
    // fetch
    static func fetchingFromCoreData(){
        let request = NSFetchRequest<NSManagedObject>(entityName: "Movies")
        request.returnsObjectsAsFaults = false
        do {
            let result = try Context.fetch(request)
            for data in result {
                let movie = MovieModel(title: data.value(
                    forKey: "title") as! String, poster_path: data.value(forKey: "poster_path") as? String, overview: data.value(forKey: "overview") as? String, id: data.value(forKey: "id") as! Int
                )
                favouritsDataBase.append(movie)
                isFavourit[data.value(forKey: "id") as! Int] = true
            }
        } catch {
            print(error)
        }
    }
    // delete
    static func deleteFromCoreData(_ data: MovieModel){
        let request = NSFetchRequest<NSManagedObject>(entityName: "Movies")
        request.predicate = NSPredicate(format: "id = %@", "\(data.id)")
        do {
            let result = try Context.fetch(request)
            guard let dataWillBeRemoved = result.first else {return}
            Context.delete(dataWillBeRemoved)
            try Context.save()
        } catch {
            print(error)
        }
        
    }
}
