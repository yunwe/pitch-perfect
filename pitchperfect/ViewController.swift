//
//  ViewController.swift
//  pitchperfect
//
//  Created by Saw Yu Nwe on 2/18/17.
//  Copyright © 2017 Saw Yu Nwe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblRecord: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func record(_ sender: UIButton) {
        lblRecord.text = "Recording ..."
    }
    
    


}

