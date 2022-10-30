//
//  ViewController.swift
//  Test
//
//  Created by karan dhiman on 13/04/22.
//

import UIKit

class ViewController: UIViewController {
    
    //    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var collectionItems: UICollectionView!
    
    //    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    
    let numbers = [1,2,3,4,5,6,7,8,9,10, 11,12,13,14,15,16,17,18,19,20, 21,22,23,24,25,26,27,28,29,30]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collectionItems.delegate = self
        
        collectionItems.dataSource = self
        
        //        collectionItems.addObserver(self, forKeyPath: "contentSize", options: NSKeyValueObservingOptions.old.union(NSKeyValueObservingOptions.new), context: nil)
        
        let layout = collectionItems.collectionViewLayout as? UICollectionViewFlowLayout // casting is required because UICollectionViewLayout doesn't offer header pin. Its feature of UICollectionViewFlowLayout
        layout?.sectionHeadersPinToVisibleBounds = true
        
        collectionItems.collectionViewLayout = layout!
        
        print("Change 3")
        print("Change 4")
        print("Change 2")
        
    }
    
    //    override func viewWillDisappear(_ animated: Bool) {
    //        collectionItems.removeObserver(self,forKeyPath: "contentSize")
    //    }
    //
    //    override func observeValue(forKeyPath keyPath: String?, of object: Any?,
    //                                   change: [NSKeyValueChangeKey : Any]?,
    //                                   context: UnsafeMutableRawPointer?) {
    //
    //        if let obj = object as? UICollectionView,
    //           obj == self.collectionItems &&
    //            keyPath == "contentSize" {
    //            collectionViewHeight.constant = collectionItems.contentSize.height
    //        }
    //    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 2
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 {
            return 0
        }else {
            return numbers.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Home", for: indexPath) as! Cell
        
        cell.numbersLabel.text = String(numbers[indexPath.item])
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 100, height: 100)
        
    }
    
    //supplementary views
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if indexPath.section == 0 {
            
            let headerView = collectionItems.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "myHeader", for: indexPath) as! HeaderView
            headerView.headerTitle.text = "My Books"
            headerView.headerTitle.backgroundColor = UIColor.yellow
            return headerView
        } else {
            
            let headerView = collectionItems.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "myHeader", for: indexPath) as! HeaderView
            headerView.headerTitle.text = "My Books"
            headerView.headerTitle.backgroundColor = UIColor.blue
            return headerView
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        if section == 0 {
            return CGSize(width: self.view.frame.size.width, height: 250)
        } else {
            return CGSize(width: self.view.frame.size.width, height: 75)
        }
        
    }
    
}

