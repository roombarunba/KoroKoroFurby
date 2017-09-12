//
//  ViewController.swift
//  KoroKoroFurby
//
//  Created by nttr on 2017/08/23.
//  Copyright © 2017年 nttr.hirtoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    var timer: Timer!
    
    var charactor: CharactorClass = CharactorClass();
    var ashiba1: AshibaClass = AshibaClass();
    var ashiba2: AshibaClass = AshibaClass();
    var ashiba3: AshibaClass = AshibaClass();
    var ashiba4: AshibaClass = AshibaClass();
    var ashiba5: AshibaClass = AshibaClass();
    
    @IBOutlet var  longPressGesture:UILongPressGestureRecognizer!;
    
    var ashibaArray: Array<AshibaClass> = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
        charactor.initCharactor();
        
        ashibaArray.append(ashiba1);
        
        ashibaArray.append(ashiba2);
        
        ashibaArray.append(ashiba3);
        
        ashibaArray.append(ashiba4);
        
        ashibaArray.append(ashiba5);
        
        // 画像サイズ
        let rect = CGRect(x:0, y:0, width:charactor.imageWidth, height:charactor.imageHeight)
        // UIImageView のインスタンス生成,ダミーでimage1を指定
        charactor.imageView.frame = rect;
        // 画像が画面中央にくるように位置合わせ
        let screenWidth = self.view.bounds.width
        let screenHeight = self.view.bounds.height
        charactor.imageView.center = CGPoint(x:screenWidth/2, y:screenHeight/2)
        // view に追加する
        self.view.addSubview(charactor.imageView);
        
        var bCx:CGFloat = -10000;
        var bCy:CGFloat = -10000;
        
        for ashiba in ashibaArray{
            ashiba.makeAshiba(beforeCx: bCx, beforeCy: bCy, screenWidth: screenWidth);
            ashiba.ashibaView.center = CGPoint(x: ashiba.initCx, y: ashiba.initCy)
            bCx = ashiba.initCx;
            bCy = ashiba.initCy;
            self.view.addSubview(ashiba.ashibaView);
        }
        
        // ロングプレスを定義
        longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longPressView(sender:)))  //Swift3
        
        longPressGesture.minimumPressDuration = 0  //3秒間以上押された場合にロングプレスとする
        longPressGesture.allowableMovement = 30  //ロングプレスを判定する指が動いていい範囲、単位はpx
        
        self.view.addGestureRecognizer(longPressGesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        timer = Timer.scheduledTimer(timeInterval: 0.017, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        timer.fire()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        timer.invalidate()
    }
    
    var gravity: CGFloat = 1.2;
    let noGravity: Int = 7;
    let vy_limit: CGFloat = 15;
    
    
    func update(tm: Timer) {
        if((charactor.imageView.center.y + charactor.imageHeightHalf) > self.view.bounds.height){
            charactor.vy = -15;
            charactor.hoppedCount = 0;
        }else if(charactor.vy < vy_limit && charactor.hoppedCount >= noGravity){
            charactor.vy += gravity;
        }
        
        charactor.hoppedCount += 1;
        
        // 画面端移動判定
        if(charactor.imageView.center.x + charactor.vx
            < CGFloat(-1*(charactor.imageWidthHalf/2)) && charactor.vx < 0){
            charactor.imageView.center.x = self.view.bounds.width + charactor.imageWidth/2;
        }else if(charactor.imageView.center.x + charactor.vx
            > CGFloat(self.view.bounds.width + charactor.imageWidthHalf/2)
            && charactor.vx > 0){
            charactor.imageView.center.x = -1*(charactor.imageHeightHalf/2);
        }
        
        

        
        for ashiba in ashibaArray{
            print("----------")
            
            print(charactor.imageView.center.y + charactor.imageHeightHalf + charactor.vy
                < ashiba.ashibaView.center.y - ashiba.heightHalf + 15)
            print(                        (charactor.imageView.center.y + charactor.imageHeightHalf + charactor.vy) - (ashiba.ashibaView.center.y - ashiba.heightHalf) > 5
                
                ||
                
                (ashiba.ashibaView.center.y - ashiba.heightHalf) -
                (charactor.imageView.center.y + charactor.imageHeightHalf + charactor.vy) > 5)
            print(charactor.imageView.center.x + charactor.imageWidthHalf + charactor.vx
                > ashiba.ashibaView.center.x - ashiba.widthHalf + 2)
            print(charactor.imageView.center.x - charactor.imageWidthHalf + charactor.vx
                < ashiba.ashibaView.center.x + ashiba.widthHalf - 2)
            print(charactor.vy >= 0)
            
            
            print("----------")
            
            
            print("　　　　　　")
            print(charactor.imageView.center.y)
            print(charactor.imageHeightHalf)
            print(charactor.vy)
            print(ashiba.ashibaView.center.y)
            print(ashiba.heightHalf)
            
            
            if( // 足場の上部周辺にいる判定
                    (charactor.imageView.center.y + charactor.imageHeightHalf + charactor.vy) - (ashiba.ashibaView.center.y - ashiba.heightHalf) <= 35
                
                    &&
                        
                    (charactor.imageView.center.y + charactor.imageHeightHalf + charactor.vy) - (ashiba.ashibaView.center.y - ashiba.heightHalf) > 15
                
                    &&
                
                    // 足場より右側にいる判定
                    charactor.imageView.center.x + charactor.imageWidthHalf + charactor.vx
                    > ashiba.ashibaView.center.x - ashiba.widthHalf + 2
                    
                    &&
                    
                    // 足場より左側にいる判定
                    charactor.imageView.center.x - charactor.imageWidthHalf + charactor.vx
                    < ashiba.ashibaView.center.x + ashiba.widthHalf - 2
                    
                    
                    &&
                    
                    // 落下中判定
                    charactor.vy >= 0
                
                ){
                
                charactor.vy = -15;
                charactor.hoppedCount = 0;
                
            }
        }
        
        charactor.imageView.center = CGPoint(x: charactor.imageView.center.x + charactor.vx
            , y: charactor.imageView.center.y + charactor.vy);
    }
    
    // ロングプレス時に実行される
    func longPressView(sender: UILongPressGestureRecognizer) {
        let x:Int = Int(longPressGesture.location(in: nil).x)
        
        if(x < Int(self.view.bounds.width/2)){
            if(charactor.vx > -5){
                charactor.vx += -0.3;
            }
        }else{
            if(charactor.vx < 5){
                charactor.vx += 0.3;
            }
        }
    }

    
    
    
    
}

