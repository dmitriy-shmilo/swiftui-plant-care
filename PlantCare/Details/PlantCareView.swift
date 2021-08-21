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
	
	let model: Plant
	@State private var currentPanel: CarePanel = .water
	
	var body: some View {
		HStack {
			switch currentPanel {
			case .water:
				PlantCareChartView(title: "Water Level", value: model.water)
			case .temperature:
				PlantCareChartView(title: "Temperature", value: model.temperature)
			case .light:
				PlantCareChartView(title: "Light Level", value: model.light)
			}
			
			Spacer()
			let buttons = [
				(panel: CarePanel.water, title: "Water meter", image: "Water", imageHeight: 30.0),
				(panel: CarePanel.temperature, title: "Temperature", image: "Temperature", imageHeight: 25.0),
				(panel: CarePanel.light, title: "Sunlight", image: "Light", imageHeight: 40.0),
			]
			VStack(alignment: .trailing, spacing: 25) {
				ForEach(buttons, id: \.self.panel) { button in
					HStack {
						Text(button.title)
							.font(.system(size: 16, weight: .semibold, design: .rounded))
							.foregroundColor(.itemSubtitle)
							.opacity(currentPanel == button.panel ? 0.33 : 1)
						
						Button(action: {
							withAnimation {
								currentPanel = button.panel
							}
						}) {
							Image(button.image)
								.resizable()
								.foregroundColor(.buttonForeground)
								.scaledToFit()
								.frame(height: CGFloat(button.imageHeight))
								.background(
							Circle().foregroundColor(.buttonBackground).frame(width: 40, height: 40)
						)
						}
						.frame(width: 40, height: 40)
						.disabled(currentPanel == button.panel)
						.opacity(currentPanel == button.panel ? 0.33 : 1)
					}
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
        PlantCareView(model: ModelData.plants[0])
    }
}
