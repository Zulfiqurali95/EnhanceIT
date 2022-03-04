//
//  ViewController.swift
//  ThursdayProjectApi
//
//  Created by Consultant on 3/3/22.
//

import UIKit

class ViewController: UIViewController {
    var movies = [Movie]()
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchMovie()
        setupDelegate()
        // Do any additional setup after loading the view.
    }
    
    func setupDelegate(){
        tableview.delegate = self
        tableview.dataSource = self
    }
    func fetchMovie(){
        URLSession.shared.getRequest(url: APIEndpoint.movie, decoding:Raw.self ) { [weak self] result in
            switch result {
            case .success(let raw):
                self?.movies = raw.results
                DispatchQueue.main.async {
                    self?.tableview.reloadData()
        
                
                }
            case .failure(let error):
                print(error)
                
            }
        }
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = movies[indexPath.row].original_title.capitalized
        cell.detailTextLabel?.text = String(movies[indexPath.row].popularity)
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController {
            destination.movie = movies[(tableview.indexPathForSelectedRow?.row)!]
        }
    }
}

