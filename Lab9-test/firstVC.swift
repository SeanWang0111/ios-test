//
//  firstVC.swift
//  Lab9-test
//
//  Created by Sean Wang on 2021/2/9.
//

import UIKit

class firstVC: UIViewController
{
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var registerBtn: UIButton!
    @IBOutlet var startTimeBtn: UIButton!
    var timer : Timer?
    var time = 0
    var publicNotification : NSObjectProtocol?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        registerBtn.setTitle("通知已關閉", for: .normal)
        registerBtn.setTitle("通知已開啟", for: .selected)
        startTimeBtn.setTitle("已停止計時", for: .normal)
        startTimeBtn.setTitle("已開啟計時", for: .selected)
    }
    
    @IBAction func registerPublicNotification(_ btn: UIButton)
    {
        let name = NSNotification.Name(rawValue: "public")
        if(!btn.isSelected)
        {
            publicNotification = NotificationCenter.default.addObserver(forName: name, object: nil, queue: OperationQueue.main)
            {
                (notification) in
                self.getPublicMsg(notification)
            }
            btn.isSelected = true
        }
        else
        {
            NotificationCenter.default.removeObserver(publicNotification!)
            btn.isSelected = false
        }
    }
    
    func getPublicMsg(_ notification:Notification)
    {
        let timeData = notification.object as! Dictionary<String,Int>
        showTime(timeData)
    }
    
    func showTime(_ timeData:Dictionary<String,Int>)
    {
        let hour = timeData["hour"]!
        let min = timeData["min"]!
        let sec = timeData["sec"]!
        timeLabel.text = String(format: "%02d:%02d:%02d", hour,min,sec)
    }
    
    @IBAction func startCount(_ btn: UIButton)
    {
        if(!btn.isSelected)
        {
            time = 0
            timer = Timer(timeInterval: 1, repeats: true)
            {
                (Timer) in
                self.count()
            }
            RunLoop.main.add(timer!, forMode: RunLoop.Mode.default)
            btn.isSelected = true
        }
        else
        {
            timer?.invalidate()
            btn.isSelected = false
        }
    }
    
    func count()
    {
        time = time + 1
        var timeDic = [String:Int]()
        timeDic["hour"] = Int(time/3600)
        timeDic["min"] = Int(time/60)
        timeDic["sec"] = Int(time%60)
        let name = NSNotification.Name("public")
        NotificationCenter.default.post(name:name,object: timeDic)
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
