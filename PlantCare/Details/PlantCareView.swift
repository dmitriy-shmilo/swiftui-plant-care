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
			VStack {
				Text("Water Level")
					.foregroundColor(.itemTitle)
					.font(.system(size: 10, weight: .medium))
					.padding(.top)
				RadialProgressView(
					backBarColor: .itemSubtitle.opacity(0.5),
					frontBarColor: .itemTitle,
					strokeWidth: 10,
					value: .constant(0.66)
				)
				.padding([.horizontal, .bottom], 20)
			}
			.frame(width: 160, height: 175)
			.background(RoundedCornersShape(radius: 20, corners: [.topRight, .bottomRight])
			.foregroundColor(.panelBackground))
			
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
