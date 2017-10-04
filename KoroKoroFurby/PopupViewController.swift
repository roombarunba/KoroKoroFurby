//
//  PopupViewController.swift
//  KoroKoroFurby
//
//  Created by nttr on 2017/09/27.
//  Copyright © 2017年 nttr.hirtoki. All rights reserved.
//

import UIKit

class PopupViewController: UIViewController {
    
    @IBOutlet var textField: UITextField!;

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let ud = UserDefaults.standard;
        if((ud.string(forKey: "scoreName")) != nil){
            textField.text =  ud.string(forKey: "scoreName")!;
        }else{
            
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
