//
//  UITableViewController.swift
//  AFSample
//
//  Created by IOS Dev on 6/9/17.
//  Copyright © 2017 IOS DevTest. All rights reserved.
//

import UIKit
import Alamofire

class TableViewController: UITableViewController {
    var titlesArray = [String]()
    var bodiesArray = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        //self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
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
                
                //print(self.titlesArray.count)//=100
                //print(self.bodiesArray.count)//=100
                
                //print(self.titlesArray)//tested success
                //print(self.bodiesArray)//tested success
                
                //refresh the tableView for dispalying the data on customcells
                //self.tableView.reloadData()
                
                break
                case .failure(let error):
                print("Error")
                print(error)
                break
                
            }
        }
            //refresh the tableView for dispalying the data on customcells
            //self.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.titlesArray.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        
        // Configure the cell...
        let body = bodiesArray[indexPath.row]
        cell.bodyLabel.text = body
        
        //cell.textLabel?.text = self.bodiesArray[indexPath.row]
        //print(cell.textLabel?.text)
        
        
        return cell
    }


    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.titlesArray[section]
    }
    
    
    
    

}
