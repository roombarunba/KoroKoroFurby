//
//  CharactorClass.swift
//  KoroKoroFurby
//
//  Created by nttr on 2017/09/08.
//  Copyright © 2017年 nttr.hirtoki. All rights reserved.
//

import UIKit

class CharactorClass: NSObject {
    
    let charactor = UIImage(named:"neko.png")!
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
        // 初期化
        imageView = UIImageView(image:charactor);
        
        imageWidth = charactor.size.width*38/CGFloat(100);
        imageHeight = charactor.size.height*38/CGFloat(100);
        
        imageWidthHalf = imageWidth/CGFloat(2);
        imageHeightHalf = imageHeight/CGFloat(2);
        
    }

}
