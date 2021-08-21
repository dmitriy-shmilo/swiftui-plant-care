//
//  PlantCareView.swift
//  PlantCare
//
//  Created by Dmitriy Shmilo on 21.08.2021.
//

import SwiftUI

struct PlantCareView: View {

	enum CarePanel {
		case water
		case temperature
		case light
	}
	
	@State private var currentPanel: CarePanel = .water
	
	var body: some View {
		HStack {
			switch currentPanel {
			case .water:
				PlantCareChartView(title: "Water Level", value: 0.33)
			case .temperature:
				PlantCareChartView(title: "Temperature", value: 0.75)
			case .light:
				PlantCareChartView(title: "Light Level", value: 0.11)
			}
			
			Spacer()
			VStack(alignment: .trailing, spacing: 25) {
				HStack {
					Text("Water meter")
						.font(.system(size: 16, weight: .semibold, design: .rounded))
						.foregroundColor(.itemSubtitle)
					
					Button(action: {
						withAnimation {
							currentPanel = .water
						}
					}) {
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
					Button(action: {
						withAnimation {
							currentPanel = .temperature
						}
					}) {
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
					Button(action: {
						withAnimation {
							currentPanel = .light
						}
					}) {
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
			.frame(height: 175)
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
