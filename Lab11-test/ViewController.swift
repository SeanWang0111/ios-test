//
//  ViewController.swift
//  Lab11-test
//
//  Created by Sean Wang on 2021/2/12.
//

import UIKit
import Toast

class ViewController: UIViewController
{
    @IBOutlet var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.makeToast("顯示Toast")
        // Do any additional setup after loading the view.
    }

    @IBAction func showToastBtnclick(_ sender: Any)
    {
        let shower = textField.text
        if (shower != "")
        {
            view.makeToast(shower)
        }
        else
        {
            view.makeToast("請於上方text field中輸入要顯示的文字")
        }
    }
    
}

