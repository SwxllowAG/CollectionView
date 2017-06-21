//
//  detailsViewController.swift
//  CollectionView
//
//  Created by Galym Anuarbek on 6/20/17.
//  Copyright © 2017 Kenes Inc. All rights reserved.
//

import UIKit

class detailsViewController: UIViewController {
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var foodDescriptionLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myImageView.image = list[sectionn][roww].image
        foodNameLabel.text = list[sectionn][roww].name
        foodDescriptionLabel.text = list[sectionn][roww].description
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
