//
//  RankingViewController.swift
//  KoroKoroFurby
//
//  Created by nttr on 2017/10/04.
//  Copyright © 2017年 nttr.hirtoki. All rights reserved.
//

import UIKit
import NCMB

class RankingViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var scoreTableView: UITableView!;
    
    var scoreArray:[String] = ["a", "b", "c", "d", "e"];

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        scoreTableView.dataSource = self;
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        scoreArray.append("f");
        print(scoreArray[0])
    }
    
    @IBAction func back(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(scoreArray.count);
        return scoreArray.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!;
        cell.textLabel?.text = scoreArray[indexPath.row];
        return cell;
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
