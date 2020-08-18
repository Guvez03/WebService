//
//  Results.swift
//  WebServices
//
//  Created by ahmet on 17.08.2020.
//  Copyright © 2020 ahmet. All rights reserved.
//

import Foundation

class Results : Codable {
    
    var wrapperType : String?
    var kind : String?
    var artistName:String?
    var collectionViewUrl:String?
    
    init(wrapperType : String,kind : String,artistName:String,collectionViewUrl:String) {
        
        self.wrapperType = wrapperType
        self.artistName = artistName
        self.kind = kind
        self.collectionViewUrl = collectionViewUrl
    }
    
}
