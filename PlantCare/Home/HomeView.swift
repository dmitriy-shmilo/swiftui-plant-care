//
//  HomeView.swift
//  PlantCare
//
//  Created by Dmitriy Shmilo on 20.08.2021.
//

import SwiftUI

struct HomeView: View {
	@Environment(\.safeAreaInsets) var safeAreaInsets: EdgeInsets
	
	var body: some View {
		ZStack(alignment: .top) {
			ScrollView {
				VStack {
					Text("Your Plants")
						.foregroundColor(.font)
						.font(.system(size: 22, weight: .semibold))
						.frame(maxWidth: .infinity, alignment: .leading)
						.padding(.top, safeAreaInsets.top + 64)
						.padding(.leading, safeAreaInsets.leading + 16)
						.padding(.trailing, safeAreaInsets.trailing + 16)
					Text("overview of all plants")
						.foregroundColor(.secondary)
						.font(.system(size: 11, weight: .regular))
						.frame(maxWidth: .infinity, alignment: .leading)
						.padding(.bottom)
						.padding(.leading, safeAreaInsets.leading + 16)
						.padding(.trailing, safeAreaInsets.trailing + 16)
					
					
					ForEach(ModelData.plants) { plant in
						NavigationLink(destination:DetailsView(model: plant)) {
							ListItemView(model: plant)
								.padding(.bottom, 32)
						}
					}
				}
			}
			
			ToolbarView()
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
