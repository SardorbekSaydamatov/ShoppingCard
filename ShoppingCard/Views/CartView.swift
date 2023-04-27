//
//  CartView.swift
//  ShoppingCard
//
//  Created by Sardorbek Saydamatov on 14/04/23.
//

import SwiftUI



struct CartView: View {
    @EnvironmentObject var cart: Cart
    @State var stepper: Int = 1

    @State private var showingAlert = false

    var body: some View {

        List(cart.items.indices, id: \.self) { index in
            let item = cart.items[index]
            HStack(spacing: 20){
                AsyncImage(url: URL(string: item.imageURL)){image in
                    image
                        .resizable()
                        .scaledToFit()
                }placeholder: {
                    Color.white
                }
                .frame(width: 80)
                .padding(.leading)

                VStack{
                    Text(item.name)
                        .font(.title2)

                    Text("\(item.price)")
                        .font(.title3)
                        .foregroundColor(Color.blue)
                }
                .frame(width: 100)

                Stepper("", value: $cart.items[index].count, in: 0...Int.max)
                    .labelsHidden()
                    .background(
                        Text("\(item.count)")
                    )

            }
            .frame(maxWidth: .infinity)
        }
        .padding(.top, 150)
        .ignoresSafeArea(.all)

        var total: Double {
            return Double(cart.totalPrice) * Double(stepper)
        }

        Text("Total: $\(Int(total))")
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)

        Button {
            showingAlert = true
        } label: {
            Text("Order")
                .frame(height: 40)
                .frame(maxWidth: .infinity)
                .foregroundColor(Color.white)
                .background(Color.brown)
                .cornerRadius(5)
                .padding(.horizontal)
        }
        .alert("This function is not available yet", isPresented: $showingAlert) {
            Button("Ok", role: .cancel){}
        }
        .onChange(of: cart.items) { items in
            for (index, item) in items.enumerated() {
                if item.count == 0 {
                    cart.items.remove(at: index)
                }
            }
        }
    }
}


//struct CartView_Previews: PreviewProvider {
//    static var previews: some View {
//        
//            CartView()
//        
//        
//    }
//}








