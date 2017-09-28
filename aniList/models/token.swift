//
//  token.swift
//  aniList
//
//  Created by Oscar Navidad on 9/27/17.
//  Copyright © 2017 Adrim apps. All rights reserved.
//

import Foundation

struct tokenReponse {
    var access_token : String?
    var token_type : String?
    var expires_in : Int?
    var expires : Int?
    
    init(){}
}

extension tokenReponse {
    init?(data:NSDictionary){
        if let access_token = data["access_token"] as? String{
            self.access_token = access_token
        }
        
        if let token_type = data["token_type"] as? String{
            self.token_type = token_type
        }
        
        if let expires_in = data["expires_in"] as? Int{
            self.expires_in = expires_in
        }
        
        if let expires = data["expires"] as? Int{
            self.expires = expires
        }
    }
}
