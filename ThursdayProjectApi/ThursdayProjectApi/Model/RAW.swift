//
//  RAW.swift
//  ThursdayProjectApi
//
//  Created by Consultant on 3/3/22.
//

import Foundation
struct Raw:Codable {
    let page:Int
    let results:[Movie]
    let total_pages:Int
    let total_results:Int
}
    
