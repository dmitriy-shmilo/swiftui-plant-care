//
//  DetailsView.swift
//  PlantCare
//
//  Created by Dmitriy Shmilo on 20.08.2021.
//

import SwiftUI

struct DetailsView: View {
	let model: Plant
	@Environment(\.safeAreaInsets) var safeAreaInsets: EdgeInsets
	@State private var hasAppeared = false
	
	var body: some View {
		
		ZStack(alignment:.top) {
			ScrollView {
				VStack {
					if hasAppeared {
						DetailsHeaderView(model: model)
							.padding(.top, 64 + safeAreaInsets.top)
						
						
						Text("Plant Care")
							.font(.system(size: 18, weight: .semibold, design: .rounded))
							.foregroundColor(.itemTitle)
							.padding(.vertical)
							.padding(.leading, safeAreaInsets.leading)
							.padding(.trailing, safeAreaInsets.trailing)
							.transition(AnyTransition.move(edge: .trailing))
							.animation(.easeInOut.delay(0.2))
						
						PlantCareView(model: model)
					}
				}
				.background(
					RoundedRectangle(cornerRadius: 30)
						.foregroundColor(.darkBackground)
						.offset(x: 0, y: 250))
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
			
			DetailsToolbarView()
		}
		.ignoresSafeArea()
	}
}

struct DetailsView_Previews: PreviewProvider {
	static var previews: some View {
		Group {
			DetailsView(model: ModelData.plants[0])
		}
	}
}
