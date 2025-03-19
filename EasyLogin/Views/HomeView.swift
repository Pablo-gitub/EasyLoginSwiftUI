//
//  SwiftUIView.swift
//  EasyLogin
//
//  Created by Paolo Pietrelli on 19/03/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack{
            Text("Home Screen").font(.title)
                .fontWeight(.bold)
            Image("Logo")
        }
    }
}

#Preview {
    HomeView()
}
