//
//  CharactorClass.swift
//  KoroKoroFurby
//
//  Created by nttr on 2017/09/08.
//  Copyright © 2017年 nttr.hirtoki. All rights reserved.
//

import UIKit

class CharactorClass: NSObject {
    
    let charactor = UIImage(named:"151-free-pictogramiro.png")!
    var imageView:UIImageView!
    
    var vy: CGFloat = 0;
    var vx: CGFloat = 0;
    
    var imageWidth: CGFloat = 0;
    var imageHeight: CGFloat = 0;
    
    var imageWidthHalf: CGFloat = 0;
    var imageHeightHalf: CGFloat = 0;
    var hoppedCount: Int = 10;
    
    var merikomanai:CGFloat = 0;
    
    var jumpBool: Bool = false;
    
    func initCharactor(){
        imageView = UIImageView(image:charactor);
        
        imageWidth = charactor.size.width/CGFloat(5);
        imageHeight = charactor.size.height/CGFloat(5);
        
        imageWidthHalf = imageWidth/CGFloat(2);
        imageHeightHalf = imageHeight/CGFloat(2);
        
    }

}
