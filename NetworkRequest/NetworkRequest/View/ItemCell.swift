//
//  ItemCell.swift
//  NetworkRequest
//
//  Created by Administrator on 8/25/19.
//  Copyright © 2019 Administrator. All rights reserved.
//

import UIKit

class ItemCell : UITableViewCell {
    
    let ItemName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    let ItemPriceTag: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Price"
        return label
    }()
    let ItemPrice: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    let ItemInStockTag: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "In stock"
        return label
    }()
    let ItemInStock: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(ItemName)
        addSubview(ItemPriceTag)
        addSubview(ItemPrice)
        addSubview(ItemInStockTag)
        addSubview(ItemInStock)
        
        ItemName.setLayout(topConstraint: topAnchor, leftConstraint: leftAnchor, bottomConstraint: bottomAnchor, rightConstraint: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 0, width: frame.size.width/2, height: frame.size.height, insets: false)
        ItemPriceTag.setLayout(topConstraint: topAnchor, leftConstraint: ItemName.rightAnchor, bottomConstraint: nil, rightConstraint: nil, paddingTop: 2, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 4, height: 0, insets: false)
        ItemPrice.setLayout(topConstraint: ItemPriceTag.bottomAnchor, leftConstraint: ItemName.rightAnchor, bottomConstraint: nil, rightConstraint: nil, paddingTop: 2, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 4, height: 0, insets: false)
        ItemInStockTag.setLayout(topConstraint: topAnchor, leftConstraint: ItemPriceTag.rightAnchor, bottomConstraint: nil, rightConstraint: nil, paddingTop: 2, paddingLeft: 5, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 4, height: 0, insets: false)
        ItemInStock.setLayout(topConstraint: ItemInStockTag.bottomAnchor, leftConstraint: ItemPriceTag.rightAnchor, bottomConstraint: nil, rightConstraint: nil, paddingTop: 2, paddingLeft: 5, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 4, height: 0, insets: false)
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension UIView {
    
    func setLayout (topConstraint: NSLayoutYAxisAnchor?, leftConstraint: NSLayoutXAxisAnchor?, bottomConstraint: NSLayoutYAxisAnchor?, rightConstraint: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat, insets: Bool) {
        
        var topInsetValue = CGFloat(0)
        var bottomInsetValue = CGFloat(0)
        
        if #available(iOS 11, *), insets {
            let inset = self.safeAreaInsets
            topInsetValue = inset.top
            bottomInsetValue = inset.bottom
         }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let topValues = topConstraint {
            self.topAnchor.constraint(equalTo: topValues, constant: paddingTop + topInsetValue).isActive = true
        }
        if let leftValues = leftConstraint {
            self.leftAnchor.constraint(equalTo: leftValues, constant: paddingLeft).isActive = true
        }
        if let bottomValues = bottomConstraint {
            bottomAnchor.constraint(equalTo: bottomValues, constant: -paddingBottom - bottomInsetValue).isActive = true
        }
        if let rightValues = rightConstraint {
            rightAnchor.constraint(equalTo: rightValues, constant: -paddingRight).isActive = true
        }
        
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
    }
    
}
