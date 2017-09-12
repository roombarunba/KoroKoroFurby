//
//  AshibaClass.swift
//  KoroKoroFurby
//
//  Created by nttr on 2017/09/08.
//  Copyright © 2017年 nttr.hirtoki. All rights reserved.
//

import UIKit

class AshibaClassCCCCC {
    
    let ashiba = UIImage(named:"ashiba.jpg")!
    let asasa = UIImage(named:"151-free-pictogram.png")
    var ashibaView:UIImageView!
    
    var widthHalf: CGFloat = 0;
    var heightHalf: CGFloat = 0;
    
    //    var initCx: CGFloat = -10000;
    //    var initCy: CGFloat = -10000;
    
    var initCx: [CGFloat] = []
    var initCy: [CGFloat] = []
    
    init(viewCount:Int, screenWidth:CGFloat){
        widthHalf = ashiba.size.width/CGFloat(2);
        heightHalf = ashiba.size.height/CGFloat(2);
        //        var bCx:CGFloat = 0;
        //        var bCy:CGFloat = 0;
        //        for i in 0 ..< viewCount {
        //            var ashibaView = UIImageView(image:ashiba);
        //            if(i == 0){
        //                ashibaView = UIImageView(image:asasa);
        //                let rR = screenWidth - (2*widthHalf);
        //                let random = arc4random_uniform(UInt32(rR));
        //                initCx.append(CGFloat(random) + widthHalf);
        //                initCy.append(533.6);
        //                bCx = CGFloat(random) + widthHalf;
        //                bCy = 533.6;
        //            }else{
        //                let randomX = arc4random_uniform(70);
        //                let randomY = arc4random_uniform(50) + 450;
        //                initCx.append(bCx + CGFloat(randomX));
        //                initCy.append(CGFloat(randomY) + bCy);
        //                bCx = bCx + CGFloat(randomX);
        //                bCy = bCy + CGFloat(randomY);
        //            }
        //            ashibaView.center = CGPoint(x: bCx, y: bCy);
        //            ashibaViewArray.append(ashibaView);
        //        }
        ashibaView = UIImageView(image:ashiba);
//        makeAshiba(beforeCx: <#T##CGFloat#>, beforeCy: <#T##CGFloat#>, screenWidth: <#T##CGFloat#>)
    }
    
//    func makeAshiba(beforeCx:CGFloat, beforeCy:CGFloat, screenWidth:CGFloat){
//        if(beforeCx != -10000){
//            let randomX = arc4random_uniform(70);
//            let randomY = arc4random_uniform(50) + 450;
//            initCx = beforeCx;
//            initCy = CGFloat(randomY) + beforeCy;
//        }else{
//            let rR = screenWidth - (2*widthHalf);
//            let random = arc4random_uniform(UInt32(rR));
//            initCx = CGFloat(random) + widthHalf;
//            initCy = 533.6;
//        }
//    }
    
}
