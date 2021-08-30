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
	let parentGeometry: GeometryProxy?
	@State private var currentPanel: CarePanel = .water
	
	var body: some View {
		HStack {
			switch currentPanel {
			case .water:
				PlantCareChartView(title: "Water Level", vitals: model.water, parentGeometry: parentGeometry)
			case .temperature:
				PlantCareChartView(title: "Temperature", vitals: model.temperature, parentGeometry: parentGeometry)
			case .light:
				PlantCareChartView(title: "Light Level", vitals: model.light, parentGeometry: parentGeometry)
			}
			
			Spacer()
			let buttons = [
				(
					panel: CarePanel.water,
					title: "Water meter",
					image: "Water",
					imageHeight: 30.0,
					background: Color.statusBackgroundColor(status: model.water.status)),
				
				(
					panel: CarePanel.temperature,
					title: "Temperature",
					image: "Temperature",
					imageHeight: 25.0,
					background: Color.statusBackgroundColor(status: model.temperature.status)),
				(
					panel: CarePanel.light,
					title: "Sunlight",
					image: "Light",
					imageHeight: 40.0,
					background: Color.statusBackgroundColor(status: model.light.status)
				)
			]

			VStack(alignment: .trailing, spacing: 25) {
				ForEach(buttons, id: \.self.panel) { button in
					HStack {
						Text(button.title)
							.font(.system(size: 16, weight: .semibold, design: .rounded))
							.foregroundColor(.itemSubtitle)
							.opacity(currentPanel == button.panel ? 0.33 : 1)
						
						VitalsButton(
							imageName: button.image,
							imageHeight: CGFloat(button.imageHeight),
							backgroundColor: button.background.opacity(0.5)
						) {
							withAnimation {
								currentPanel = button.panel
							}
						}
						.disabled(currentPanel == button.panel)
						.opacity(currentPanel == button.panel ? 0.33 : 1)
					}
				}
			}
			.frame(height: 175)
		}
		.padding(.leading, (parentGeometry?.safeAreaInsets.leading ?? 0) + 16)
		.padding(.trailing, (parentGeometry?.safeAreaInsets.trailing ?? 0) + 16)
		.transition(AnyTransition.move(edge: .trailing))
		.animation(.easeInOut.delay(0.2))
	}
}

struct PlantCareView_Previews: PreviewProvider {
	static var previews: some View {
		PlantCareView(model: ModelData.plants[0], parentGeometry: nil)
	}
}
