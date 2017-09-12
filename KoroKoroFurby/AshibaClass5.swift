//
//  AshibaClass.swift
//  KoroKoroFurby
//
//  Created by nttr on 2017/09/08.
//  Copyright © 2017年 nttr.hirtoki. All rights reserved.
//

import UIKit

class AshibaClass5:AshibaMatome {
    
    let ashiba = UIImage(named:"ashiba.jpg")!
    var ashibaView:UIImageView = UIImageView();
    
    var widthHalf: CGFloat = 0;
    var heightHalf: CGFloat = 0;
    
    var initCx: CGFloat = -10000;
    var initCy: CGFloat = -10000;
    
    func initAshiba(){
        ashibaView = UIImageView(image:ashiba);
        widthHalf = ashiba.size.width/CGFloat(2);
        heightHalf = ashiba.size.height/CGFloat(2);
    }
    
    func makeAshiba(beforeCx:CGFloat, beforeCy:CGFloat, screenWidth:CGFloat){
        if(beforeCx != -10000){
            let randomX = arc4random_uniform(70);
            let randomY = arc4random_uniform(50) + 450;
            initCx = beforeCx;
            initCy = CGFloat(randomY) + beforeCy;
        }else{
            let rR = screenWidth - (2*widthHalf);
            let random = arc4random_uniform(UInt32(rR));
            initCx = CGFloat(random) + widthHalf;
            initCy = 533.6;
        }
    }

}
