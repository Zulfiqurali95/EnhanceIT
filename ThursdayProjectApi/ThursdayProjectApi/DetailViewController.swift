//
//  DetailViewController.swift
//  ThursdayProjectApi
//
//  Created by Consultant on 3/3/22.
//

import UIKit
class DetailViewController: UIViewController {
    
    @IBOutlet weak var Image: UIImageView!
    
    @IBOutlet weak var About: UILabel!
    @IBOutlet weak var Lb1: UILabel!
    
    var movie:Movie?
    override func viewDidLoad() {
        super.viewDidLoad()
    setupView()
        
    }
    
        func setupView() {
        Lb1.text = movie?.original_title
        About.text = movie?.overview
        let baseURL = "https://image.tmdb.org/t/p/original" + (movie!.poster_path)!
        let urlString = URL(string:baseURL)
        Image.getImage(from: urlString!)
            
      
    }
    
}

