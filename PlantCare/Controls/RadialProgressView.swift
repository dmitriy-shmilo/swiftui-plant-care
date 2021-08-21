//
//  RadialProgressView.swift
//  PlantCare
//
//  Created by Dmitriy Shmilo on 21.08.2021.
//

import SwiftUI

struct RadialProgressView: View {
	let backBarColor: Color
	let frontBarColor: Color
	let strokeWidth: CGFloat
	
	@Binding var value: Float
	@State private var shouldShowLabel: Bool = false
	
	var body: some View {
		// TODO: don't hardcode a delay here,
		// since it's highly specific to the details view
		let delay = 0.4

		GeometryReader { proxy in
			ZStack {
				Circle()
					.stroke(lineWidth: strokeWidth)
					.foregroundColor(backBarColor)
				Circle()
					.trim(from: 0.0, to: CGFloat(value))
					.stroke(
						style: StrokeStyle(
							lineWidth: strokeWidth,
							lineCap: .round,
							lineJoin: .round
						)
					)
					.foregroundColor(frontBarColor)
					.rotationEffect(Angle(degrees: -90))
					.animation(.easeInOut.delay(delay), value: value)
				
				if shouldShowLabel {
					Text("\(Int(min(max(value, 0.0), 1.0) * 100)) %")
						.foregroundColor(frontBarColor)
						.font(
							.system(
								size: min(proxy.size.width, proxy.size.height) / 3.5,
								weight: .semibold,
								design: .rounded
							)
						)
						.animation(
							// FIXME: this delay is completely ignored for some reason
							.easeIn.delay(delay),
							value: shouldShowLabel)
				}
			}
		}
		.onAppear {
			withAnimation {
				shouldShowLabel = true
			}
		}
	}
}

struct RadialProgressView_Previews: PreviewProvider {
	static var previews: some View {
		RadialProgressView(
			backBarColor: .gray,
			frontBarColor: .accentColor,
			strokeWidth: 25,
			value: .constant(0.33)
		)
	}
}
