//
//  ViewController.swift
//  CollectionView
//
//  Created by Zhanserik on 6/15/17.
//  Copyright © 2017 Kenes Inc. All rights reserved.
//

import UIKit

var roww = 0
var sectionn = 0

var list: [[Food]] = [
    [
        Food(name: "Garithes Yiouvetsi", description: "This classic Greek shrimp dish is baked with a tomato sauce and topped with feta cheese. Relatively quick and simple to make. This recipe goes wonderfully with rice pilaf and some crusty bread.", foodImage: #imageLiteral(resourceName: "garithes")),
        Food(name:"Mongolian Beef from the Slow Cooker", description:"Quick and easy freezer slow cooker meal.", foodImage: #imageLiteral(resourceName: "mongolian")),
        Food(name:"Apple Crisp II", description:"A simple dessert that's great served with ice cream.", foodImage: #imageLiteral(resourceName: "appleCrisp")),
        Food(name:"Crispy Herb Baked Chicken", description:"The secret ingredient is instant mashed potatoes, used to make the crispy coating.", foodImage: #imageLiteral(resourceName: "chicken")),
    ],
    [
        Food(name: "Slow Cooker Moscow Chicken", description: "This recipe is a delicious mixture of tender chicken, smokey bacon and sweet Russian dressing. Serve this saucy chicken on steamed rice or hot egg noodles.", foodImage: #imageLiteral(resourceName: "moscowChicken")),
        Food(name:"Egg and Hash Brown Pie", description:"Not only is this casserole easy to make and great tasting, it's pleasing to the eyes with it's shades of golden brown, yellow, and green. This dish is great served with sliced fruit and toast or muffins. You may substitute chopped cooked ham for the bacon if you wish.", foodImage: #imageLiteral(resourceName: "eggHash")),
        Food(name:"White Pizza Grilled Cheese", description:"If you love double-crust white pizza, this sandwich will satisfy your craving without making a whole pizza or ordering out. Great served with a side of marinara sauce for dipping and wonderful with a hearty salad.", foodImage: #imageLiteral(resourceName: "whitePizza")),
        Food(name:"Danish Cinnamon Snails", description:"Americans would call these cinnamon rolls--but this version is the original Danish version and it's absolutely wonderful. They are traditionally served with coffee or tea at Christmas time, and they are to die for!", foodImage: #imageLiteral(resourceName: "danishSnails"))
    ],
    [
        Food(name: "Chef John's Sloppy Joes", description: "The secret to a great 'Sloppy Joe' is a thick, rich, almost dry consistency, which allows it to be eaten two-fisted, sans fork.", foodImage: #imageLiteral(resourceName: "sloppyJoes")),
        Food(name:"Cottage Cheese Chicken Enchiladas", description:"Ever tried chicken enchiladas made with cottage cheese? Now's your chance! This takes some prep time, but it is well worth it. You can make it 1 day ahead, and serve the next day.", foodImage: #imageLiteral(resourceName: "chickenEnchiladas")),
        Food(name:"Aloha Chicken Burgers", description:"This tasty sandwich is like a luau on a bun!", foodImage: #imageLiteral(resourceName: "chickenBurgers")),
        Food(name:"Sophie's Zucchini Bread", description:"Extra dense with zucchini, this loaf has the classic combination of cinnamon and nuts to tempt you into a sumptuous oblivion.", foodImage: #imageLiteral(resourceName: "bread"))
    ]
    
]

class Food {
    
    var name = ""
    var description = ""
    var image: UIImage = #imageLiteral(resourceName: "image")
    
    init(name: String, description: String, foodImage: UIImage) {
        self.name = name
        self.description = description
        self.image = foodImage
    }
}

class ViewController: UIViewController {
    
    var sections: [String] = ["Traditional food","Everyday food","Fast Food"]

    @IBOutlet var collectionView: UICollectionView!
    
    @IBOutlet var layout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.layout.minimumLineSpacing = 1
        self.layout.minimumInteritemSpacing = 1
        let size = (self.view.frame.width - 2) / 3
        self.layout.itemSize = CGSize(width: size, height: size)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return list.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list[section].count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        print(indexPath)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reuseIdentifier", for: indexPath) as! ImageCollectionViewCell
        
        cell.imageView.image = list[indexPath.section][indexPath.row].image
        
        return cell
    }
}
extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        roww = indexPath.row
        sectionn = indexPath.section
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        
        if kind == UICollectionElementKindSectionHeader {
            
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerReuseIdentifier", for: indexPath) as! HeaderCollectionReusableView
            
            headerView.titleLabel.text = sections[indexPath.section]
            
            return headerView
        }
        
        return UICollectionReusableView()
        
    }
    
}

