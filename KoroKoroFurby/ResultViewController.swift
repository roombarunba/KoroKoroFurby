//
//  ResultViewController.swift
//  KoroKoroFurby
//
//  Created by nttr on 2017/09/19.
//  Copyright © 2017年 nttr.hirtoki. All rights reserved.
//

import UIKit
import NCMB
import PopupDialog

class ResultViewController: UIViewController {
    
    var score: Int64 = 0;
    
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var highScoreLabel: UILabel!
    
    var sendBool = false;

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 現在のスコア表示
        scoreLabel.text = "score : " + String(score);
        
        // ハイスコア表示
        let ud = UserDefaults.standard;
        let highScore = ud.string(forKey: "highScore")!;
        highScoreLabel.text = "highscore : " + highScore;
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // リトライ処理
    @IBAction func retry(){
        self.dismiss(animated: true, completion: nil);
    }
    
    @IBAction func sendScore(){
        
        let finishButton = DefaultButton(title: "OK"){
            
        };
        
        if(sendBool){
            let finishedPop = PopupDialog(title: "送信済み", message: "おつかれ");
            finishedPop.addButton(finishButton);
            self.present(finishedPop, animated: true, completion: nil);
        }else{
            // ポップアップに表示したいビュー
            let vc = PopupViewController(nibName: "PopupViewController", bundle: nil)
            
            // 表示したいビューコントローラーを指定してポップアップを作る
            let popup = PopupDialog(viewController: vc)
            
            // OKボタンを作る
            let buttonOK = DefaultButton(title: "OK") {
                
                if(vc.textField.text != "" && vc.textField.text != nil){
                    let ud = UserDefaults.standard;
                    ud.set(vc.textField.text, forKey:"scoreName");
                    ud.synchronize();
                    let object = NCMBObject(className: "Ranking");
                    object?.setObject(vc.textField.text, forKey: "Name");
                    object?.setObject(self.score, forKey: "Score");
                    object?.saveInBackground({ (error) in
                        if(error != nil){
                            let failedPop = PopupDialog(title: "送信失敗", message: "すまんな");
                            failedPop.addButton(finishButton);
                            self.present(failedPop, animated: true, completion: nil);
                        }else{
                            self.sendBool = true;
                            let successPop = PopupDialog(title: "送信成功", message: "ありがとう");
                            successPop.addButton(finishButton);
                            self.present(successPop, animated: true, completion: nil);
                        }
                    })
                }else{
                    let angryPop = PopupDialog(title: "スコアネームを入力してください", message: "おこです");
                    angryPop.addButton(finishButton);
                    self.present(angryPop, animated: true, completion: nil);
                }
            }
            
            let buttonCancel = DefaultButton(title: "Cancel") {
                
            }
            buttonCancel.titleColor = UIColor.red;
            
            // ポップアップにボタンを追加
            popup.addButton(buttonOK)
            popup.addButton(buttonCancel)
            
            // 作成したポップアップを表示する
            present(popup, animated: true, completion: nil)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
