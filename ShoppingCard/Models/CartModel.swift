//
//  CartModel.swift
//  ShoppingCard
//
//  Created by Sardorbek Saydamatov on 26/04/23.
//

import Foundation

class Cart: ObservableObject{
    @Published var items: [Product] = []
    
    var totalPrice: Double {
        return Double(items.reduce(0) { $0 + $1.count * $1.price })
        }
    
    func add(product: Product){
        items.append(product)
    }
    
    func removeProduct(at index: Int){
        items.remove(at: index)
    }
}
