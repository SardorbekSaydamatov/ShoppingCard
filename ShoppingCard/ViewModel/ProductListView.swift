//
//  ProductListView.swift
//  ShoppingCard
//
//  Created by Sardorbek Saydamatov on 14/04/23.
//

import SwiftUI

struct ProductListView: View {
    
    let products: [Product]
    
    @EnvironmentObject var cart: Cart
    @State var selectedProduct: Product?
    @State var isPresented: Bool = false
    
    private let adaptiveColumns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        LazyVGrid(columns: adaptiveColumns) {
            ForEach(products) { product in
                VStack(spacing: 5){
                    
                    Group{
                        AsyncImage(url: URL(string: product.imageURL)){image in
                            image
                                .resizable()
                                .scaledToFit()
                        }placeholder: {
                            Color.white
                        }
                        .frame(width: 150, height: 150)
                        .padding(.horizontal)
                        
                        Text(product.name)
                            .font(.headline)
                        
                        Text(product.description)
                            .font(.subheadline)
                            .lineLimit(2)
                            .foregroundColor(Color.black)
                        
                        Text("$\(product.price)")
                            .font(.title3)
                            .foregroundColor(Color.blue)
                        
                            
                        HStack{
                            
                            Button {
                                cart.add(product: product)
                            } label: {
                                Text("Add to cart")
                                    .frame(width: 100, height: 40)
                                    .background(Color.blue)
                                    .foregroundColor(Color.white)
                                    .cornerRadius(5)
                            }
                        }
                        .padding(.bottom, 15)
                    }
                }
                .border(.bar)
                .background(Color.white)
                .padding(.horizontal)
                .onTapGesture {
                    selectedProduct = product
                    isPresented = true
                }
            }
            .fullScreenCover(item: $selectedProduct) { product in
                DetailView(products: product)
            }
        }
        .padding(15)
    }
}

//struct ProductListView_Previews: PreviewProvider {
//     
//    static var previews: some View {
//        ProductListView()
//    }
//}
