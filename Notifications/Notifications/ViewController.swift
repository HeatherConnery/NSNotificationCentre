//
//  ViewController.swift
//  Notifications
//
//  Created by Heather Connery on 2015-12-02.
//  Copyright © 2015 HConnery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var testObject:Moderator!

    override func viewDidLoad() {
        super.viewDidLoad()
        // create an observer
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("notificationMethod:"), name: "notificationID", object: nil)
    }
    
    override func viewDidAppear(animated: Bool) {
        testObject = Moderator()
    }
    
    //convenience function for notification method
    func notificationMethod(notification:NSNotification) {
        guard let urlObject = notification.object else {
            return // or throw
        }
        let blob = urlObject as! [URLObject] // Cast as String/Int/ etc
        for dataObjects in blob {
           // print(dataObjects.RETURN_STRING)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

