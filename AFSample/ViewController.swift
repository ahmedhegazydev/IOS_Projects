//
//  ViewController.swift
//  AFSample
//
//  Created by IOS Dev on 6/8/17.
//  Copyright © 2017 IOS DevTest. All rights reserved.
//

import UIKit

import Alamofire

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    
    @IBOutlet weak var tableView: UITableView!
    
    //var usersArray = [Users]()
    var usersArray = [AnyObject]()
    var titlesArray = [String]()
    var bodiesArray = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //using Alamofire framework
        Alamofire.request("https://jsonplaceholder.typicode.com/posts").responseJSON { response in

        //Alamofire.request("http://thecodeeasy.com/test/swiftjson.json").responseJSON{ response in
            
        
            switch response.result {
            //pass the result to result variable
            case .success(let result):
            
                //print (result);//tested success
                //loop on all array bojects of json file
            for anItem in result as! [Dictionary<String, AnyObject>]{
                
                //print(anItem) //tested success
                let title = anItem["title"]//get the object child that tagged with name "title"
                self.titlesArray.append(title! as! String)
                
                let body = anItem["body"]//get the object child taht tagged with name "body"
                self.bodiesArray.append(body! as! String)
                }
                //print(self.titlesArray)//tested success
                //print(self.bodiesArray)//tested success
            
                //refresh the tableView for dispalying the data on customcells
                self.tableView.reloadData()
                
            
            break
            case .failure(let error):
                print("Error")
                print(error)
                break
            }
            
        }
                /*
            
            if let dic  = result.value as? Dictionary<String, AnyObject>{
                if let innerDic = dic["actors"] {
                    self.usersArray = (innerDic as? [AnyObject])!
                    self.tableView.reloadData()
                    
                }else{
                    
                }
                
            }
        }
        */
            /*
            switch response.result {
            case .success(let json):
                
                //print(json)
                self.usersArray  = [(json as? Array<Dictionary<String, String>>)! as AnyObject]
                print(self.usersArray)
                self.tableView.reloadData()
                
                break
                
            case .failure(let error):
                
                break
            }
 */
            
        
 
    
        /*
        // 1
        let reposURL = NSURL(string: "https://jsonplaceholder.typicode.com/posts")
        // 2
        if let JSONData = NSData(contentsOf: reposURL! as URL) {
            // 3
            if let json = JSONSerialization.JSONObjectWithData(JSONData, options: nil, error: nil) as? NSDictionary {
                // 4
                if let reposArray = json["items"] as? [NSDictionary] {
                    // 5
                    for item in reposArray {
                        repositories.append(Repository(json: item))
                    }
                }
            }
        }
 */
            
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell
        
        let title = titlesArray[indexPath.row]
        print("titlle:", title)
        cell?.titleLabel.text = title
        let body = bodiesArray[indexPath.row]
        print("body:", body)
        cell?.bodyLabel.text = body
        
        
        /*
        let title = usersArray[indexPath.row]["title"]
        //print(title)
        cell?.titleLabel.text = title as? String
        
 */
 
 return cell!;
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titlesArray.count;
        //return usersArray.count;
        // or as both are equal in size return bodiesArray.count
    }
    
    
    
    
    
    
    
    
    
}

