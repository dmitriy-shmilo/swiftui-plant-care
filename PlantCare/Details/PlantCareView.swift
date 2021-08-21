//
//  PlantCareView.swift
//  PlantCare
//
//  Created by Dmitriy Shmilo on 21.08.2021.
//

import SwiftUI

struct PlantCareView: View {
	var body: some View {
		HStack {
			RoundedCornersShape(radius: 20, corners: [.topRight, .bottomRight])
				.frame(width: 160, height: 175)
				.foregroundColor(.panelBackground)
			Spacer()
			VStack(alignment: .trailing, spacing: 25) {
				
				HStack {
					Text("Water meter")
						.font(.system(size: 16, weight: .semibold, design: .rounded))
						.foregroundColor(.itemSubtitle)
					
					Button(action: {}) {
						Image("Water")
							.resizable()
							.foregroundColor(.buttonForeground)
							.scaledToFit()
							.frame(height: 30)
					}
					.frame(width: 40, height: 40)
					.background(
						Circle().foregroundColor(.buttonBackground)
					)
				}
				
				
				HStack {
					Text("Temperature")
						.font(.system(size: 16, weight: .semibold, design: .rounded))
						.foregroundColor(.itemSubtitle)
					Button(action: {}) {
						Image("Temperature")
							.resizable()
							.foregroundColor(.buttonForeground)
							.scaledToFit()
							.frame(height: 25)
					}
					.frame(width: 40, height: 40)
					.background(
						Circle().foregroundColor(.buttonBackground)
					)
				}
				
				HStack {
					Text("Sunlight")
						.font(.system(size: 16, weight: .semibold, design: .rounded))
						.foregroundColor(.itemSubtitle)
					Button(action: {}) {
						Image("Light")
							.resizable()
							.foregroundColor(.buttonForeground)
							.scaledToFit()
							.frame(height: 40)
					}
					.frame(width: 40, height: 40)
					.background(
						Circle().foregroundColor(.buttonBackground)
					)
				}
			}
			.padding(.trailing)
		}
		.transition(AnyTransition.move(edge: .trailing))
		.animation(.easeInOut.delay(0.2))
	}
}


struct PlantCareView_Previews: PreviewProvider {
    static var previews: some View {
        PlantCareView()
    }
}
