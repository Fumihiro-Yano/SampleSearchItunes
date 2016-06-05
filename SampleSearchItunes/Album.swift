//
//  Album.swift
//  SampleSearchItunes
//
//  Created by 矢野史洋 on 2016/06/05.
//  Copyright © 2016年 矢野史洋. All rights reserved.
//

import UIKit

class Album: NSObject {

    var title:String!
    var artist:String!
    var genre:String!
    var artworkURL:String!
    
    init (title:String, artist:String, genre:String, artworkURL:String) {
        super.init()
        
        self.title = title
        self.artist = artist
        self.genre = genre
        self.artworkURL = artworkURL
        
    }
    
}
