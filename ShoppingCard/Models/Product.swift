import SwiftUI

//class CartModel: ObservableObject{
//    let id = UUID()
//    let name: String
//    let imageURL: String
//    let price: Int
//    var count: Int
//    
//    init(name: String, imageURL: String, price: Int, count: Int) {
//        self.name = name
//        self.imageURL = imageURL
//        self.price = price
//        self.count = count
//    }
//}


struct Product: Codable, Identifiable, Equatable {
    let id: Int
    let name, description: String
    let imageURL: String
    let price: Int
    var count: Int
    

    enum CodingKeys: String, CodingKey {
        case id, name, description
        case imageURL = "imageUrl"
        case price
        case count
    }
}

struct ParseJson{
    func loadProducts() -> [Product] {
        guard let url = Bundle.main.url(forResource: "products", withExtension: "json") else {
            fatalError("Failed to locate products.json in app bundle.")
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let products = try decoder.decode([Product].self, from: data)
            return products
        } catch {
            fatalError("Failed to decode products.json: \(error.localizedDescription)")
        }
    }
}
