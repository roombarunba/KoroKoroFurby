//
//  AshibaClass.swift
//  KoroKoroFurby
//
//  Created by nttr on 2017/09/08.
//  Copyright © 2017年 nttr.hirtoki. All rights reserved.
//

import UIKit

class AshibaClass: NSObject {
    
    let ashiba = UIImage(named:"ashiba.jpg")!
    var ashibaView:UIImageView!
    
    var widthHalf: CGFloat = 0;
    var heightHalf: CGFloat = 0;
    
    func initAshiba(){
        ashibaView = UIImageView(image:ashiba);
        widthHalf = ashiba.size.width/CGFloat(2);
        heightHalf = ashiba.size.height/CGFloat(2);
    }

}
