//
//  raceVC.swift
//  Lab8-test
//
//  Created by Sean Wang on 2021/2/8.
//

import UIKit

class raceVC: UIViewController
{
    @IBOutlet var rabbitProgress: UIProgressView!
    @IBOutlet var turtleProgress: UIProgressView!
    var rabbitDis = 0
    var turtleDis = 0
    var finishFlag = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func startBtnClick(_ sender: Any)
    {
        rabbitDis = 0
        turtleDis = 0
        finishFlag = false
        rabbitProgress.progress = 0
        turtleProgress.progress = 0
        let secQueue = DispatchQueue.global()
        secQueue.async
        {
            while(self.rabbitDis<100 && self.turtleDis<100)
            {
                self.rabbitRun()
                self.showProgress()
            }
            self.showWinner()
        }
        secQueue.async
        {
            while(self.rabbitDis<100 && self.turtleDis<100)
            {
                self.turtleRun()
                self.showProgress()
            }
            self.showWinner()
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func rabbitRun()
    {
        let move = Int.random(in: 1...10)
        rabbitDis+=move
        var sleepTime = Int.random(in: 1...10)
        if(turtleDis>80)
        {
            sleepTime = 1
        }
        print("兔子走",move,"休息",sleepTime)
        usleep(useconds_t( sleepTime*50000))
    }
    func turtleRun()
    {
        turtleDis+=2
        usleep(50000)
    }
    
    func showProgress()
    {
        let mainQueue = DispatchQueue.main
        mainQueue.async
        {
            self.rabbitProgress.progress = Float(self.rabbitDis)/100
            self.turtleProgress.progress = Float(self.turtleDis)/100
        }
    }
    
    func showWinner()
    {
        if(!finishFlag)
        {
            finishFlag = true
            var winMsg = ""
            if(rabbitDis > turtleDis)
            {
                winMsg = "兔子獲勝"
            }
            else if(rabbitDis<turtleDis)
            {
                winMsg = "烏龜獲勝"
            }
            else
            {
                winMsg = "平手"
            }
            let mainQueue = DispatchQueue.main
            mainQueue.async
            {
                let msgView = UIAlertController(title: winMsg, message: "", preferredStyle: .alert)
                let determineAction = UIAlertAction(title: "確定", style: .default, handler: nil)
                msgView.addAction(determineAction)
                self.present(msgView, animated: true, completion: nil)
            }
        }
    }
}

