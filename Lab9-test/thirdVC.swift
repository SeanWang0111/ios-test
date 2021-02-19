//
//  thirdVC.swift
//  Lab9-test
//
//  Created by Sean Wang on 2021/2/9.
//

import UIKit

class thirdVC: UIViewController
{
    @IBOutlet var sender: UILabel!
    @IBOutlet var msg: UILabel!
    @IBOutlet var timeLabel: UILabel!
    var publicNotification : NSObjectProtocol?
    var regionNotification : NSObjectProtocol?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        initNotification()
    }
    
    func initNotification()
    {
        let publicName = NSNotification.Name("public")
        publicNotification = NotificationCenter.default.addObserver(forName: publicName, object: nil, queue: OperationQueue.main)
        {
            (notification) in
            let timeData = notification.object as! Dictionary<String,Int>
            self.showTime(timeData)
        }
        let regionName = NSNotification.Name("region")
        regionNotification = NotificationCenter.default.addObserver(forName: regionName, object: nil, queue: OperationQueue.main)
        {
            (notification) in
            let msgData = notification.object as! Dictionary<String,String>
            self.showMsg(msgData)
        }
    }
    
    func showTime(_ timeData:Dictionary<String,Int>)
    {
        let hour = timeData["hour"]!
        let min = timeData["min"]!
        let sec = timeData["sec"]!
        timeLabel.text = String(format: "%02d:%02d:%02d",hour,min,sec)
    }
    
    func showMsg(_ msgData:Dictionary<String,String>)
    {
        sender.text = msgData["sender"]
        msg.text = msgData["msg"]
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
