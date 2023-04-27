//
//  ContentView.swift
//  ShoppingCard
//
//  Created by Sardorbek Saydamatov on 10/04/23.
//

import SwiftUI

//let navBarAppearence = UINavigationBarAppearance()


class CustomNavigationBar: UINavigationBar {
    override func layoutSubviews() {
        super.layoutSubviews()
        if let scrollView = subviews.first(where: { $0 is UIScrollView }) as? UIScrollView {
            scrollView.contentOffset = .zero
        }
    }
}

struct ContentView: View {
    
    init() {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
            UINavigationBar.appearance().compactAppearance = appearance
            UINavigationBar.appearance().tintColor = .white
            UINavigationBar.appearance().barTintColor = .systemTeal
            UINavigationBar.appearance().shadowImage = UIImage()
            UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
            UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            UINavigationBar.appearance().isTranslucent = false
        }
    
   @StateObject var cart = Cart()
    
    var body: some View {
        
        
        
        NavigationView {
                ScrollView{
                    ProductListView(products: ParseJson().loadProducts())
                        .background(Color.gray.opacity(0.1))
                        .environmentObject(cart)
                        
                }
        }
        .navigationTitle("Products")
        .navigationBarItems(trailing: NavigationLink(destination: CartView().environmentObject(cart)) {
            Image(systemName: "cart")
        })
        
                            
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
        
    }
}
