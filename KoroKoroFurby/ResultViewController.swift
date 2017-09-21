//
//  ResultViewController.swift
//  KoroKoroFurby
//
//  Created by nttr on 2017/09/19.
//  Copyright © 2017年 nttr.hirtoki. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var score: Int64 = 0;
    
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var highScoreLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        scoreLabel.text = "score : " + String(score);
        
        let ud = UserDefaults.standard;
        let highScore = ud.string(forKey: "highScore")!;
        highScoreLabel.text = "highscore : " + highScore;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func retry(){
        self.dismiss(animated: true, completion: nil);
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
