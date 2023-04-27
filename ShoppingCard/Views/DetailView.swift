//
//  DetailView.swift
//  ShoppingCard
//
//  Created by Sardorbek Saydamatov on 17/04/23.
//

import SwiftUI

struct DetailView: View {
    
    @EnvironmentObject var cart: Cart

    let products: Product
    @Environment (\.presentationMode) var presentaionMode
    
    var body: some View {
        
        ScrollView {
                    VStack(spacing: 0) {
                        GeometryReader { geometry in
                            AsyncImage(url: URL(string: products.imageURL)) {image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding(.top, 50)
                                    .padding(.trailing, 30)
                            }placeholder: {
                                Color.white
                            }
                           // .position(x: 170, y: 230)
                            .frame(width: geometry.size.width, height: geometry.size.height)
                                .offset(y: geometry.frame(in: .global).minY > 0 ? -geometry.frame(in: .global).minY : 0)
                                .clipped()
                                .padding()
                                
                        }
                        .frame(height: 450)
                        
                        
                        VStack(alignment: .center, spacing: 20) {
                        
                       
                            
                            Text(products.name)
                                .font(.title)
                                .foregroundColor(.black)
                                .padding()
                            
                            Text(products.description)
                                .padding()
                                .foregroundColor(Color.black)
                        
                            
                                Text("$\(products.price)")
                                .foregroundColor(Color.accentColor)
                                .padding(.leading, -170)
                            
                            
                            HStack(spacing: 20){
                                
                                Button(action: {
                                    presentaionMode.wrappedValue.dismiss()
                                }, label: {
                                    Text("Back")
                                        .frame(width: 150, height: 50)
                                        .foregroundColor(Color.white)
                                        .background(Color.red.opacity(0.8))
                                        .cornerRadius(10)
                                })
                                
                                Button(action: {
                                    cart.add(product: products)
                                }, label: {
                                    Text("Add to basket")
                                        .frame(width: 150, height: 50)
                                        .foregroundColor(Color.white)
                                        .background(Color.blue.opacity(0.8))
                                        .cornerRadius(10)
                                })
                            }
                            
                                                        
                            
                            
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(20, corners: [.topLeft, .topRight])
                        .offset(y: -50)
                    }
                }
                .edgesIgnoringSafeArea(.all)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct DetailView_Previews: PreviewProvider {
    
    static let item: Product = Product(id: 10, name: "iphone 6S", description: "black", imageURL: "https://www.notebookcheck.net/uploads/tx_nbc2/4_zu_3_teaser_05.jpg", price: 650, count: 1)
    
    static var previews: some View {
        DetailView(products: item)
    }
}
