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
    
    var number: Int = 0;
    
    var imageView:UIImageView!
    let image1 = UIImage(named:"151-free-pictogram.png")!
    
    @IBOutlet var tapGesture:UITapGestureRecognizer!;
    
    @IBOutlet var  longPressGesture:UILongPressGestureRecognizer!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        // 画像サイズ
        let rect = CGRect(x:0, y:0, width:image1.size.width/5, height:image1.size.height/5)
        // UIImageView のインスタンス生成,ダミーでimage1を指定
        imageView = UIImageView(image:image1);
        imageView.frame = rect
        // 画像が画面中央にくるように位置合わせ
        let screenWidth = self.view.bounds.width
        let screenHeight = self.view.bounds.height
        imageView.center = CGPoint(x:screenWidth/2, y:screenHeight/2)
        // view に追加する
        self.view.addSubview(imageView)
        
        
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
    
    var vy: Double = 0;
    var gravity: Double = 1.2;
    var hoppedCount: Int = 10;
    let noGravity: Int = 7;
    let vy_limit: Double = 15;
    
    var vx: Double = 0;
    
    func update(tm: Timer) {
        if((imageView.center.y + (image1.size.height/10)) > self.view.bounds.height){
            vy = -15;
            hoppedCount = 0;
        }else if(vy < vy_limit && hoppedCount >= noGravity){
            vy += gravity;
        }
        
        hoppedCount += 1;
        
        if(imageView.center.x + CGFloat(vx) < CGFloat(-1*(image1.size.height/20)) && vx < 0){
            imageView.center.x = self.view.bounds.width + image1.size.height/20;
        }else if(imageView.center.x + CGFloat(vx) > CGFloat(self.view.bounds.width + image1.size.height/20)
            && vx > 0){
            imageView.center.x = -1*(image1.size.height/20);
        }
        
        imageView.center = CGPoint(x: imageView.center.x + CGFloat(vx), y: imageView.center.y + CGFloat(vy));
    }
    
    // ロングプレス時に実行される
    func longPressView(sender: UILongPressGestureRecognizer) {
        let x:Int = Int(longPressGesture.location(in: nil).x)
        
        if(x < Int(self.view.bounds.width/2)){
            if(vx > -5){
                vx += -0.3;
            }
        }else{
            if(vx < 5){
                vx += 0.3;
            }
        }
    }

    
    
    
    
}

