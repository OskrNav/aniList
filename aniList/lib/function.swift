//
//  function.swift
//  aniList
//
//  Created by Oscar Navidad on 9/26/17.
//  Copyright © 2017 Adrim apps. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftSpinner
// HTTP Methods

func Getdata(_ titleAlert:String = "Anime List" , instasnce:UIViewController, url:String  , SelectedMethod:HTTPMethod = .get , params:Parameters = [:] , headers:HTTPHeaders = [:] , callback: @escaping (NSDictionary) -> Void){

    
    
    if GeneralSettings.activeToken.isEmpty{
        let parameters : Parameters = ["grant_type":GeneralSettings.grant_type , "client_id": GeneralSettings.CLIENT_ID , "client_secret" : GeneralSettings.CLIENT_SECRET]
        let urlKey = GeneralSettings.BASE_URL+"/"+"auth/access_token"
        Alamofire.request(urlKey, method: .post , parameters: parameters).responseJSON(completionHandler: { response in
            switch response.result {
            case .success:
                //code
                print(response)
                if let json = response.result.value {
                    let item = json as? NSDictionary
                    if let error = item!["error"] as? String{
                        print(error)
                        GeneralSettings.activeToken = ""
                        return
                    }
                    
                    print("key getting ")
                    GeneralSettings.activeToken = (item!["access_token"] as? String)!
                    DispatchQueue.main.async {
                        let urlRequest = GeneralSettings.buildURl(path: url)
                        makeCall(titleAlert, instasnce: instasnce, url: urlRequest, SelectedMethod: SelectedMethod, params: params, headers: headers, callback: callback)
                    }
                }
                
            case .failure(let error):
                //code
                print(error.localizedDescription)
            }
        })
        
    }
    else{
        let urlRequest = GeneralSettings.buildURl(path: url)
        makeCall(titleAlert, instasnce: instasnce, url: urlRequest, SelectedMethod: SelectedMethod, params: params, headers: headers, callback: callback)
    
    }
    
}

func makeCall(_ titleAlert:String = "Anime List" , instasnce:UIViewController, url:String  , SelectedMethod:HTTPMethod = .get , params:Parameters = [:] , headers:HTTPHeaders = [:] , callback: @escaping (NSDictionary) -> Void){
        
        print(url)
        Alamofire.request(url, method: SelectedMethod  , parameters: (params.isEmpty) ?  nil : params   , encoding: JSONEncoding.default , headers: headers ).responseJSON(completionHandler: { response in
            switch response.result {
                
            case .success:
                if let json = response.result.value {
                    if let item = json as? NSDictionary{
                    // init
                        if ((item["error"] as? String) != nil){
                            let errorDescription = item["error_description"] as? String
                            errorMessage(titleAlert,errorMessage: errorDescription!  ,instance: instasnce)
                            return
                        }
                    }
                    
                    let data : NSDictionary = ["data":json as? NSArray ?? ""]
                    DispatchQueue.main.async {
                        callback(data)
                        SwiftSpinner.hide()
                    }
                    
                    //find
                    
                }
                
            case .failure(let error):
                DispatchQueue.main.async {
                    
                    errorMessage(titleAlert,errorMessage: error.localizedDescription ,instance: instasnce)
                    SwiftSpinner.hide()
                }
            }
        })
    }


func errorMessage(_ title:String = "" , errorMessage:String  , instance : UIViewController){
    
    let alert = UIAlertController(title: title, message: errorMessage , preferredStyle: UIAlertControllerStyle.alert)
    let action = UIAlertAction(title: NSLocalizedString("Ok", comment: ""), style: UIAlertActionStyle.default , handler: nil)
    alert.addAction(action)
    instance.present(alert, animated: true, completion: nil)
    
}
