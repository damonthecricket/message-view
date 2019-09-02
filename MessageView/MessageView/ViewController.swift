//
//  ViewController.swift
//  MessageView
//
//  Created by Damon Cricket on 30.08.2019.
//  Copyright © 2019 DC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView?
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let data = Data.shared.data[indexPath.row]
        return MessageCollectionViewCell.size(forData: data, width: view.frame.size.width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Data.shared.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let data = Data.shared.data[indexPath.row]
        
        var cell: MessageCollectionViewCell
        
        switch data.type {
        case .incoming:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "input.message.cell", for: indexPath) as! InputMessageCollectionViewCell
        case .outgoing:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "output.message.cell", for: indexPath) as! OutputMessageCollectionViewCell
        }
        
        cell.adjust(withData: data)
        
        return cell
    }
}

