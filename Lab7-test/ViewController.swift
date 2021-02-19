//
//  ViewController.swift
//  Lab7-test
//
//  Created by Sean Wang on 2021/2/7.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet var tableViewController: UIView!
    @IBOutlet var collectionViewContainer: UIView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        collectionViewContainer.isHidden = true
        let fruitNameArr =
        [
            "apple", "avocado", "banana", "cherries", "coconut", "grapes", "lemon", "orange", "peach", "pineapple", "strawberry", "tomato"
        ]
        let userDefaults = UserDefaults.standard
        userDefaults.set(fruitNameArr, forKey: "fruitName")
        title = "demo table view"
    }

    @IBAction func switchBtnClick(_ btn: UIBarButtonItem)
    {
        if(btn.tag == 0)
        {
            btn.tag = 1
            title = "demo collection view"
        }
        else
        {
            btn.tag = 0
            title = "demo table view"
        }
        tableViewController.isHidden = !tableViewController.isHidden
        collectionViewContainer.isHidden = !collectionViewContainer.isHidden
    }
    
}

