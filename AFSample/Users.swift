//
//  File.swift
//  AFSample
//
//  Created by IOS Dev on 6/8/17.
//  Copyright © 2017 IOS DevTest. All rights reserved.
//

import UIKit

class Users {
    
    var name: String?
    var description: String?
    var html_url: String?
    
    init(json: NSDictionary) {
        self.name = json["name"] as? String
        self.description = json["description"] as? String
        self.html_url = json["html_url"] as? String
    }
}
