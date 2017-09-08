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
    var ashiba: AshibaClass = AshibaClass();
    
    @IBOutlet var  longPressGesture:UILongPressGestureRecognizer!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
        charactor.initCharactor();
        ashiba.initAshiba();
        
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
        
        ashiba.ashibaView.center = CGPoint(x: screenWidth/2, y: 4*screenHeight/5)
        self.view.addSubview(ashiba.ashibaView);
        
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
        
        
        if( // 足場より上にいる判定
            charactor.imageView.center.y + charactor.imageHeightHalf + charactor.vy
            > ashiba.ashibaView.center.y - ashiba.heightHalf + 15
            
            &&
            
            // 足場の上端付近にいる判定
            charactor.imageView.center.y + charactor.imageHeightHalf + charactor.vy
            - ashiba.ashibaView.center.y - ashiba.heightHalf < 5
            
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
