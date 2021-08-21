//
//  HomeView.swift
//  PlantCare
//
//  Created by Dmitriy Shmilo on 20.08.2021.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
			VStack {
				ToolbarView()
					.padding()
					.padding(.top, 30)
				Text("Your Plants")
					.foregroundColor(.font)
					.font(.system(size: 22, weight: .semibold))
					.frame(maxWidth: .infinity, alignment: .leading)
					.padding(.horizontal)
				Text("overview of all plants")
					.foregroundColor(.secondary)
					.font(.system(size: 11, weight: .regular))
					.frame(maxWidth: .infinity, alignment: .leading)
					.padding([.horizontal, .bottom])
				
				
				ForEach(0...3, id: \.self) { _ in
					NavigationLink(destination:DetailsView()) {
						ListItemView()
					}
				}
			}
		}
		.ignoresSafeArea()
		.navigationBarHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
