//
//  ItunesConnection.swift
//  SampleSearchItunes
//
//  Created by 矢野史洋 on 2016/06/05.
//  Copyright © 2016年 矢野史洋. All rights reserved.
//

import UIKit

class ItunesConnection: NSObject {
    
    class func getAlbumForString(searchString:String, completionHandler:(Album)->()) {
        
        let escapedString = searchString.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet())
        
        let url = NSURL(string: "https://itunes.apple.com/search?term=\(escapedString!)&media=music")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data:NSData?, response:NSURLResponse?, error:NSError?) -> Void in
            if error == nil{
                let itunesDict = (try! NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)) as! NSDictionary
                
                let resultsArray = itunesDict.objectForKey("results") as! [Dictionary<String,AnyObject>]
                
                if resultsArray.count > 0 {
                    if let resultsDict = resultsArray.first {
                        let artist = resultsDict["artistName"] as! String
                        let artworkURL = resultsDict["artworkUrl100"] as! String
                        let albumTitle = resultsDict["collectionName"] as! String
                        let genre = resultsDict["primaryGenreName"] as! String
                        
                        let album = Album(title: albumTitle, artist: artist, genre: genre, artworkURL: artworkURL)
                        completionHandler(album)
                    }
                }
                
            }
                
            })
        task.resume()
    }
}
