//
//  PlantCareChartView.swift
//  PlantCare
//
//  Created by Dmitriy Shmilo on 21.08.2021.
//

import SwiftUI

struct PlantCareChartView: View {
	let title: String
	let vitals: Vitals<Float>
	let parentGeometry: GeometryProxy?

	@State private var progressValue: Float = 0.0
	@State private var isVisible: Bool = false
	
	var body: some View {
		VStack {
			Text(title)
				.foregroundColor(.itemTitle)
				.font(.system(size: 10, weight: .medium))
				.padding(.top)
			RadialProgressView(
				backBarColor: .itemSubtitle.opacity(0.5),
				frontBarColor: .itemTitle,
				strokeWidth: 10,
				label: vitals.asFormattedString(),
				value: $progressValue
			)
			.padding([.horizontal, .bottom], 20)
			.onAppear {
				withAnimation {
					progressValue = vitals.value
				}
			}
		}
		.frame(width: 160 + (parentGeometry?.safeAreaInsets.leading ?? 0) + 16, height: 175)
		
		.background(RoundedCornersShape(radius: 20, corners: [.topRight, .bottomRight])
						.foregroundColor(.panelBackground))
		.padding(.leading, -(parentGeometry?.safeAreaInsets.leading ?? 0) - 16)
		.transition(.move(edge: .leading))
		.animation(.easeIn.delay(isVisible ? 0.0 : 0.3))
		.onAppear {
			isVisible = true
		}
		.onDisappear {
			isVisible = false
		}
		
	}
}

struct PlantCareChartView_Previews: PreviewProvider {
    static var previews: some View {
		PlantCareChartView(title:"Water Level", vitals: Vitals<Float>(0.17, .percent, .healthy), parentGeometry: nil)
    }
}
