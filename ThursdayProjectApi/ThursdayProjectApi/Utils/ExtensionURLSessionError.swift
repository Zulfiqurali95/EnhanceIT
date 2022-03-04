//
//  ExtensionURLSessionError.swift
//  ThursdayProjectApi
//
//  Created by Consultant on 3/3/22.
//

import Foundation
extension URLSession{
    enum RequestErrors:Error{
        case badURL
        case badData
    }
}
