//
//  WebViewController.swift
//  KoroKoroFurby
//
//  Created by nttr on 2017/10/20.
//  Copyright © 2017年 nttr.hirtoki. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let favoriteURL = NSURL(string: "http://blog.goo.ne.jp/hoppingroppo/e/cc628f123a4e3dd1ef0dd62a386aa0c1")
        // stringにはお好きなurlを入れてください。
        
        let urlRequest = NSURLRequest(url: favoriteURL as! URL)
        // urlをネットワーク接続が可能な状態にしている（らしい）
        
        webView.loadRequest(urlRequest as URLRequest)
        // 実際にwebViewにurlからwebページを引っ張ってくる。
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(){
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
