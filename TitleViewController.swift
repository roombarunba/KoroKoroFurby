//
//  TitleViewController.swift
//  KoroKoroFurby
//
//  Created by nttr on 2017/09/21.
//  Copyright © 2017年 nttr.hirtoki. All rights reserved.
//

import UIKit
import PopupDialog

class TitleViewController: UIViewController {
    
    @IBOutlet var startLabel: UILabel!;

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // ゲーム画面へ
    @IBAction func start(){
        self.performSegue(withIdentifier: "toGame", sender: nil);
    }
    
    // デバック用ハイスコアリセットボタン
    @IBAction func scoreReset(){
        let ud = UserDefaults.standard;
        ud.set("0", forKey: "highScore");
        ud.synchronize();
    }
    
    @IBAction func ranking(){
        self.performSegue(withIdentifier: "toRankingKari", sender: nil);
    }
    
    @IBAction func exp(){
        let popup = PopupDialog(title: "せつめい", message: "画面左半分を長押しで左に飛び六方\n\n画面右半分を長押しで右に飛び六方\n\nいかに飛び六方といえども慣性が飛び六方\n\n高みを目指して飛び六方！")
        
        let finishButton = DefaultButton(title: "終"){
            
        };
        
        popup.addButton(finishButton);
        
        // 作成したポップアップを表示する
        present(popup, animated: true, completion: nil)
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
