//
//  main.swift
//  Store
//
//  Created by Ted Neward on 2/29/24.
//

import Foundation

protocol SKU {
    var name: String{get}
    func price() -> Int
}


class Item: SKU {
    var name: String
    var priceEach: Int

    init(name: String, priceEach: Int) {
        self.name = name
        self.priceEach = priceEach
    }

    func price() -> Int {
        return priceEach
    }
}


class Receipt {
    var items: [SKU] = []

    func allItems() -> [SKU] {
        return items
    }
    
    func addItem(_ item: SKU) {
            items.append(item)
    }
    
    func total() -> Int {
        return items.reduce(0) {$0 + $1.price()}
    }

    func output() -> String {
        var recept = "Receipt:\n"
        for item in items {
            recept += "\(item.name): $\(Double(item.price()) / 100)\n"
        }
        recept += "------------------\n"
        recept += "TOTAL: $\(Double(total()) / 100)"
        return recept
    }

    func clear() {
        items.removeAll()
    }
}


class Register {
    var receipt = Receipt()

    func scan(_ item: SKU) {
        receipt.addItem(item)
    }

    func subtotal() -> Int {
        return receipt.total()
    }

    func total() -> Receipt {
        let finalReceipt = receipt
        receipt = Receipt()
        return finalReceipt
    }

    func displaySubtotal() {
        print("Current subtotal: $\(Double(subtotal()) / 100.0)")
    }
}


class Store {
    let version = "0.1"
    func helloWorld() -> String {
        return "Hello world"
    }
}

