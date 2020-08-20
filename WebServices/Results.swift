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
    var artworkUrl100:String?
    var trackName:String?
    var country:String?
    var primaryGenreName:String?
    
    init(wrapperType : String,kind : String,artistName:String,artworkUrl100:String,country:String,primaryGenreName:String,trackName:String) {
        
        self.wrapperType = wrapperType
        self.artistName = artistName
        self.kind = kind
        self.artworkUrl100 = artworkUrl100
        self.country = country
        self.primaryGenreName = primaryGenreName
        self.trackName = trackName
    }
    
}
