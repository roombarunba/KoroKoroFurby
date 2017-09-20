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
    var ashiba6: AshibaClass = AshibaClass();
    var ashiba7: AshibaClass = AshibaClass();
    var ashiba8: AshibaClass = AshibaClass();
    var ashiba9: AshibaClass = AshibaClass();
    var ashiba10: AshibaClass = AshibaClass();
    
    @IBOutlet var  longPressGesture:UILongPressGestureRecognizer!;
    
    var ashibaArray: Array<AshibaClass> = [];
    
    var bCx:CGFloat = -10000;
    var bCy:CGFloat = -10000;
    
    var gravity: CGFloat = 1.2;
    let noGravity: Int = 7;
    let vy_limit: CGFloat = 15;
    
    var ground: Bool = true;
    
    var score: Int64 = 0;
    var maxHeight: Int64 = 0;
    
    @IBOutlet var scoreLabel: UILabel!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // ロングプレスを定義
        longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longPressView(sender:)))  //Swift3
        
        longPressGesture.minimumPressDuration = 0  //3秒間以上押された場合にロングプレスとする
        longPressGesture.allowableMovement = 30  //ロングプレスを判定する指が動いていい範囲、単位はpx
        
        self.view.addGestureRecognizer(longPressGesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        initGame();
        timer = Timer.scheduledTimer(timeInterval: 0.017, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        timer.fire()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        timer.invalidate()
    }
    
    func initGame(){
        score = 0;
        maxHeight = Int64(self.view.bounds.height);
        
        charactor = CharactorClass();
        charactor.initCharactor();
        
        ashiba1 = AshibaClass();
        ashiba2 = AshibaClass();
        ashiba3 = AshibaClass();
        ashiba4 = AshibaClass();
        ashiba5 = AshibaClass();
        ashiba6 = AshibaClass();
        ashiba7 = AshibaClass();
        ashiba8 = AshibaClass();
        ashiba9 = AshibaClass();
        ashiba10 = AshibaClass();
        
        ashibaArray.append(ashiba1);
        ashibaArray.append(ashiba2);
        ashibaArray.append(ashiba3);
        ashibaArray.append(ashiba4);
        ashibaArray.append(ashiba5);
        ashibaArray.append(ashiba6);
        ashibaArray.append(ashiba7);
        ashibaArray.append(ashiba8);
        ashibaArray.append(ashiba9);
        ashibaArray.append(ashiba10);
        
        ground = true;
        
        bCx = -10000;
        bCy = -10000;
        
        // 画像サイズ
        let rect = CGRect(x:0, y:0, width:charactor.imageWidth, height:charactor.imageHeight)
        // UIImageView のインスタンス生成,ダミーでimage1を指定
        charactor.imageView.frame = rect;
        // 画像が画面中央にくるように位置合わせ
        let screenWidth = self.view.bounds.width
        let screenHeight = self.view.bounds.height
        charactor.imageView.center = CGPoint(x:screenWidth/2, y:screenHeight - charactor.imageHeightHalf);
        
        // view に追加する
        self.view.addSubview(charactor.imageView);
        
        for ashiba in ashibaArray{
            ashiba.makeAshiba(beforeCx: bCx, beforeCy: bCy, screenWidth: screenWidth, screenHeight: screenHeight);
            ashiba.ashibaView.center = CGPoint(x: ashiba.initCx, y: ashiba.initCy)
            bCx = ashiba.initCx;
            bCy = ashiba.initCy;
            self.view.addSubview(ashiba.ashibaView);
        }
        
        self.view.bringSubview(toFront: scoreLabel)
    }
    
    func update(tm: Timer) {
        // 地面からジャンプ
        if(ground){
            if((charactor.imageView.center.y + charactor.imageHeightHalf) > self.view.bounds.height){
                charactor.vy = -15;
                charactor.hoppedCount = 0;
            }
        }
        
        // 重力追加
        if(charactor.vy < vy_limit && charactor.hoppedCount >= noGravity){
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
        
        if(charactor.imageView.center.y + charactor.vy < view.self.bounds.height/3){
            ground = false;
            score = score + Int64(-1 * charactor.vy);
            charactor.imageView.center = CGPoint(x: charactor.imageView.center.x + charactor.vx
                , y: charactor.imageView.center.y);
            for ashiba in ashibaArray{
                ashiba.initCx = ashiba.ashibaView.center.x;
                ashiba.initCy = ashiba.ashibaView.center.y;
                ashiba.ashibaView.center = CGPoint(x: ashiba.ashibaView.center.x,
                                                   y: ashiba.ashibaView.center.y - charactor.vy)
                if(ashiba.ashibaView.center.y > self.view.bounds.height + (2*ashiba.heightHalf)){
                    ashiba.makeAshiba(beforeCx: bCx, beforeCy: bCy, screenWidth: view.self.bounds.width, screenHeight: view.self.bounds.height);
                    
                    print(ashiba.initCx);
                    print(ashiba.initCy);
                    
//                    bCx = ashiba.initCx;
//                    bCy = ashiba.initCy - charactor.vy;
                    
                    ashiba.ashibaView.center = CGPoint(x: ashiba.initCx, y: ashiba.initCy);
                    print(ashibaArray.count);
                }
                bCx = ashiba.ashibaView.center.x;
                bCy = ashiba.ashibaView.center.y;
            }
        }else{
            charactor.imageView.center = CGPoint(x: charactor.imageView.center.x + charactor.vx
                , y: charactor.imageView.center.y + charactor.vy);
        }
        
        // 初期位置からのスコア計算
        if(score < Int64(2*self.view.bounds.height/3) && maxHeight > Int64(charactor.imageView.center.y)){
            score = score + Int64(-1 * charactor.vy);
            maxHeight = Int64(charactor.imageView.center.y);
        }
        
        scoreLabel.text = "score : " + String(score);
        
        // ゲームオーバー判定
        if(charactor.imageView.center.y > self.view.bounds.height + (2*charactor.imageHeight)){
            // 画面遷移
            self.performSegue(withIdentifier: "toResult", sender: nil);
        }
        
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController = segue.destination as! ResultViewController;
        resultViewController.score = score;
    }

    
    
    
    
}

