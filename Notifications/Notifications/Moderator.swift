//
//  Moderator.swift
//  Notifications
//
//  Created by Heather Connery on 2015-12-02.
//  Copyright © 2015 HConnery. All rights reserved.
//

import UIKit
import Foundation

class Moderator: NSObject, NSProtocol {
    // blob => ex. large chunk of data
    private var blob:URLObject = URLObject()
    private var returnedStringsFromFunction = [URLObject]()
    
    var RETURN_OBJECT:[URLObject] {
        return returnedStringsFromFunction
    }
    func notificationInitializer() {
        self.addDataToFunction(self.blob)
        NSNotificationCenter.defaultCenter().postNotificationName("notificationID", object: returnedStringsFromFunction)
    }
    
    override init() {
        super.init()
        self.notificationInitializer()
    }
    
    func addDataToFunction(var urls: URLObject) -> [URLObject] {
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0)) { () -> Void in
            let startTime = CFAbsoluteTimeGetCurrent()
            
            for var i = 0; i < 10000; i++ {
                
                urls = URLObject(url: "this is a website")
                self.returnedStringsFromFunction.append(urls)
            }
            let endTime = CFAbsoluteTimeGetCurrent()
            let totalTime = (endTime - startTime) * 1000 //to get miliseconds
            print("Add data to function took: \(totalTime)")
        }
        
        return returnedStringsFromFunction
    }
}
