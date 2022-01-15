//
//  ViewController.swift
//  NotificationUpdate
//
//  Created by mai nguyen on 1/13/22.
//

import UIKit
import UserNotifications
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Ask the user for permission
        var center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.badge,.sound,.alert]) { granted, error in
            if error == nil {
                print("User permission is granted: \(granted)")
                }
            }
    
        // Create the notification content
        var content = UNMutableNotificationContent()
        content.title = "Taylor SWift is live"
        content.body = "Go and connect with Taylor Swift in her video"
        
        // Create the notification trigger
        let date = Date().addingTimeInterval(10)
        let dateComponent = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        
        //Create the request
        let uuidString = UUID().uuidString
        
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        
        // Register the request
        center.add(request) { error in
            if let error = error  {
                print("error")
            } else {
                print("success")
            }
        }
    }
}
