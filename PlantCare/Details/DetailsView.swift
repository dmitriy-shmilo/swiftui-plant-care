//
//  DetailsView.swift
//  PlantCare
//
//  Created by Dmitriy Shmilo on 20.08.2021.
//

import SwiftUI

struct DetailsView: View {
	let model: Plant
	@State private var hasAppeared = false
	
	var body: some View {
		GeometryReader { proxy in
			ScrollView {
				VStack {
					DetailsToolbarView()
						.padding()
						.padding(.top, proxy.safeAreaInsets.top)
						.padding(.leading, proxy.safeAreaInsets.leading)
						.padding(.trailing, proxy.safeAreaInsets.trailing)
					
					if hasAppeared {
						DetailsHeaderView(model: model, parentGeometry: proxy)
						
						
						Text("Plant Care")
							.font(.system(size: 18, weight: .semibold, design: .rounded))
							.foregroundColor(.itemTitle)
							.padding(.vertical)
							.padding(.leading, proxy.safeAreaInsets.leading)
							.padding(.trailing, proxy.safeAreaInsets.trailing)
							.transition(AnyTransition.move(edge: .trailing))
							.animation(.easeInOut.delay(0.2))
						
						PlantCareView(model: model, parentGeometry: proxy)
					}
				}
				.background(
					RoundedRectangle(cornerRadius: 30)
						.foregroundColor(.darkBackground)
						.offset(x: 0, y: 370))
			}
			.background(Color.darkBackground.offset(x: 0, y: 400))
			.ignoresSafeArea()
			.navigationBarHidden(true)
			.onAppear {
				withAnimation {
					hasAppeared = true
				}
			}
			.onDisappear {
				hasAppeared = false
			}
		}
	}
}

struct DetailsView_Previews: PreviewProvider {
	static var previews: some View {
		DetailsView(model: ModelData.plants[0])
	}
}
