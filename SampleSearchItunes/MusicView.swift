//
//  MusicView.swift
//  SampleSearchItunes
//
//  Created by 矢野史洋 on 2016/06/06.
//  Copyright © 2016年 矢野史洋. All rights reserved.
//

import UIKit

class MusicView: UIView {

    @IBOutlet weak var artworkImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    
    func addDataToMusicView (album:Album) {
        let albumURL = NSURL(string: album.artworkURL)
        let imageData = NSData(contentsOfURL: albumURL!)
        artworkImageView.image = UIImage(data: imageData!)
        titleLabel.text = album.title
        artistLabel.text = album.artist
        genreLabel.text = album.genre
    }
}
