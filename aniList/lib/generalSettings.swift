//
//  generalSettings.swift
//  aniList
//
//  Created by Oscar Navidad on 9/26/17.
//  Copyright © 2017 Adrim apps. All rights reserved.
//

import Foundation
import Alamofire
class GeneralSettings: NSObject {
    public static let  BASE_URL = "https://anilist.co/api"//
    public static let  grant_type = "client_credentials"
    public static let  CLIENT_ID = "oskrnav-akiwx"
    public static let  CLIENT_SECRET = "43eQBOxGvHSSUBlPh1P0fgFSXdqk"
    public static var activeToken : String = ""
    public static var isGettingToken : Bool = false
    /* getting token*/

    
    class func buildURl(path:String)->String{
        
        return BASE_URL+"/"+path+"?access_token="+activeToken
        
    }
}
