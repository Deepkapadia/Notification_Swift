//
//  ViewController.swift
//  User_Notification_Swift4
//
//  Created by DeEp KapaDia on 23/05/18.
//  Copyright © 2018 DeEp KapaDia. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge,.sound]) { (success, error) in
            
            if error != nil {
                
                print("Authorizarion Unsuccessfull")
                
            }else{
                
                print("Authorization Success")
                
            }
        }
        
        
    }


   
    @IBAction func NotifyBTN(_ sender: UIButton) {
        
        timednotificatiuons(inSeconds: 3) { (success) in
            
            if success {
                
                print("Success")
                
            }
            
        }
        
    }
    
    
    func timednotificatiuons(inSeconds: TimeInterval, completion: @escaping (_ Success: Bool) -> ()) {
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: inSeconds, repeats: false)

        let content = UNMutableNotificationContent()
        
        content.title = "Breaking News"
        content.subtitle = "Not Working"
        content.body = "hiiiii i am deep kapadia here .......... come on and join me now ....."
        
        let request = UNNotificationRequest(identifier: "CustommNotification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { (error) in
            if error != nil {
                
                completion(false)
                
                
            }else{
                
                completion(true)
                
            }
            
        }
        
    }

}

