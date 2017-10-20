//
//  RankingKariViewController.swift
//  KoroKoroFurby
//
//  Created by nttr on 2017/10/04.
//  Copyright © 2017年 nttr.hirtoki. All rights reserved.
//

import UIKit
import NCMB
import PopupDialog

class RankingKariViewController: UIViewController {
    
    @IBOutlet var labelNumber1: UILabel!;
    @IBOutlet var labelNumber2: UILabel!;
    @IBOutlet var labelNumber3: UILabel!;
    @IBOutlet var labelNumber4: UILabel!;
    @IBOutlet var labelNumber5: UILabel!;
    @IBOutlet var labelNumber6: UILabel!;
    @IBOutlet var labelNumber7: UILabel!;
    @IBOutlet var labelNumber8: UILabel!;
    @IBOutlet var labelNumber9: UILabel!;
    @IBOutlet var labelNumber10: UILabel!;
    
    @IBOutlet var labelScore1: UILabel!;
    @IBOutlet var labelScore2: UILabel!;
    @IBOutlet var labelScore3: UILabel!;
    @IBOutlet var labelScore4: UILabel!;
    @IBOutlet var labelScore5: UILabel!;
    @IBOutlet var labelScore6: UILabel!;
    @IBOutlet var labelScore7: UILabel!;
    @IBOutlet var labelScore8: UILabel!;
    @IBOutlet var labelScore9: UILabel!;
    @IBOutlet var labelScore10: UILabel!;

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        var labelArray = [labelNumber1, labelNumber2,labelNumber3,labelNumber4,labelNumber5,
                          labelNumber6,labelNumber7,labelNumber8,labelNumber9,labelNumber10,]
        var scoreArray = [labelScore1, labelScore2, labelScore3, labelScore4, labelScore5,
                          labelScore6, labelScore7, labelScore8, labelScore9, labelScore10];
        var kanzi = ["壱", "弐", "参", "肆", "伍", "陸", "漆", "捌", "玖", "拾"]
        let query = NCMBQuery(className: "Ranking")
        query?.order(byDescending: "Score");
        query?.limit = 10;
        query?.findObjectsInBackground({ (result, error) in
            if(error != nil){
                let finishButton = DefaultButton(title: "OK"){
                    
                };
                let failedPop = PopupDialog(title: "通信失敗", message: "すまんな");
                failedPop.addButton(finishButton);
                self.present(failedPop, animated: true, completion: nil);
            }else{
                let rankingArray = result as! [NCMBObject];
                var i = 0;
                for data in rankingArray{
                    var s: String;
                    let num = data.object(forKey: "Score")!;
                    let num_s = String(describing: num);
                    s = kanzi[i] + ":" + String(data.object(forKey: "Name")! as! String);
                    labelArray[i]?.text = s;
                    scoreArray[i]?.text = num_s;
                    i = i + 1;
                }
            }
        })
    }
    
    @IBAction func back(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func web(){
        self.performSegue(withIdentifier: "toWeb", sender: nil);
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
