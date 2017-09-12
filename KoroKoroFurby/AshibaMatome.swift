//
//  AshibaMatome.swift
//  KoroKoroFurby
//
//  Created by nttr on 2017/09/12.
//  Copyright © 2017年 nttr.hirtoki. All rights reserved.
//

import UIKit

protocol AshibaMatome {
    var ashiba:UIImage{get}
    var ashibaView:UIImageView{get}

    var widthHalf: CGFloat{get}
    var heightHalf: CGFloat{get}
    
    var initCx: CGFloat{get}
    var initCy: CGFloat{get}
    
    func initAshiba()
    
    func makeAshiba(beforeCx:CGFloat, beforeCy:CGFloat, screenWidth:CGFloat)
}
