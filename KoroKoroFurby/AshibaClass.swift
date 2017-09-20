//
//  AshibaClass.swift
//  KoroKoroFurby
//
//  Created by nttr on 2017/09/08.
//  Copyright © 2017年 nttr.hirtoki. All rights reserved.
//

import UIKit

class AshibaClass {
    
    let ashiba = UIImage(named:"ashiba.jpg")!
    var ashibaView:UIImageView!
    
    var widthHalf: CGFloat = 0;
    var heightHalf: CGFloat = 0;
    
    var initCx: CGFloat = -10000;
    var initCy: CGFloat = -10000;
    
    init(){
        ashibaView = UIImageView(image:ashiba);
        widthHalf = ashiba.size.width/CGFloat(2);
        heightHalf = ashiba.size.height/CGFloat(2);
    }
    
    func makeAshiba(beforeCx:CGFloat, beforeCy:CGFloat, screenWidth:CGFloat, screenHeight:CGFloat){
        if(beforeCx != -10000){
            let randomX = Int(arc4random_uniform(300)) - 150;
            let randomY = Int(arc4random_uniform(50)) + 100;
            initCx = beforeCx + CGFloat(randomX);
            initCy = -1*CGFloat(randomY) + beforeCy;
            if(initCx <  widthHalf){
                let kabeX = Int(arc4random_uniform(40)) + 30;
                initCx = screenWidth - CGFloat(kabeX);
            }else if(initCx > screenWidth - widthHalf){
                initCx = 30;
            }
        }else{
            let rR = screenWidth - (2*widthHalf);
            let random = arc4random_uniform(UInt32(rR));
            initCx = CGFloat(random) + widthHalf;
            initCy = screenHeight - 100;
        }
    }
    
}


