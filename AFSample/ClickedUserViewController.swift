//
//  ClickedUserViewController.swift
//  AFSample
//
//  Created by IOS Dev on 6/9/17.
//  Copyright © 2017 IOS DevTest. All rights reserved.
//

import UIKit

class ClickedUserViewController: UIViewController {

    
    
    @IBOutlet var userTitle: UITextView!
    
    @IBOutlet var userBody: UITextView!
    
    var tit : String = ""
    var body : String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.userTitle.text = tit
        self.userBody.text = body
        
        
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    override func willMove(toParentViewController parent: UIViewController?) {
        if parent == nil {
            
            
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
