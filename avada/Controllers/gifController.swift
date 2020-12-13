//
//  gifController.swift
//  avada
//
//  Created by Irakli Grigolia on 12/4/20.
//  Copyright © 2020 Irakli Grigolia. All rights reserved.
//

import UIKit
import SwiftGifOrigin
import UserNotifications

class gifController : UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    var timeFromTC : Int!
    var categoryFromTC : String!
    
    
    
    
  
    override func viewDidLoad() {
        //imageView.loadGif(name: "jeremy")
        self.navigationItem.setHidesBackButton(true, animated: true)
       print(timeFromTC,"timee")
        if timeFromTC == 10 {
            notify(time: 5)
        let timer = Timer.scheduledTimer(timeInterval: 3 , target: self, selector: #selector(fire), userInfo: nil, repeats: false)
        }
        else if timeFromTC == 15 {
            notify(time: 15)
            let timer = Timer.scheduledTimer(timeInterval: 15 , target: self, selector: #selector(fire), userInfo: nil, repeats: false)
            
        }
        
        else if timeFromTC == 20 {
            notify(time: 1200)
            let timer = Timer.scheduledTimer(timeInterval: 20 , target: self, selector: #selector(fire), userInfo: nil, repeats: false)
        }
      
        
    
        
        
    }
    
    func notify (time : Int){
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .sound])
        { (granted, error) in
            
        }
        let content = UNMutableNotificationContent()
        content.title = "გაშრა ყელი"
        content.body = "ჩასხმის ჟამი დამდგარა"
        
        let date = Date().addingTimeInterval(TimeInterval(time))
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        let uuidString = UUID().uuidString
        
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        center.add(request) {
            (error) in
            //
        }
    }
    
//    func someFunction(delta: Int) {
//        if delta < 100 {
//            // Send alert to user if app is open
//            let alertView = UIAlertController(title: "This is an Alert!", message: "", preferredStyle: UIAlertController.Style.alert)
//            alertView.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
//            self.present(alertView, animated: true, completion: nil)
//
//            // Send user a local notification if they have the app running in the bg
//            _ = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.pushNotification), userInfo: nil, repeats: false)
//        }
//    }
//
//    // Send user a local notification if they have the app running in the bg
//   @objc func pushNotification() {
//        let notification = UILocalNotification()
//        notification.alertAction = "Go back to App"
//        notification.alertBody = "This is a Notification!"
//        notification.fireDate = NSDate(timeIntervalSinceNow: 1) as Date
//        UIApplication.shared.scheduleLocalNotification(notification)
//    }
//
   

    @objc func fire()
    {
        print("going to toast controller...")
       // self.performSegue(withIdentifier: "toToast", sender: self)
        self.navigationController?.popViewController(animated: true)
    }
    

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ToastViewController {
            let vc = segue.destination as! ToastViewController
            vc.time = self.timeFromTC
            vc.fromTCCategory = self.categoryFromTC
        }

    }
    
}
