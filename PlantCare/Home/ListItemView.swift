//
//  ListItemView.swift
//  PlantCare
//
//  Created by Dmitriy Shmilo on 20.08.2021.
//

import SwiftUI

struct ListItemView: View {
	let model: Plant
	
	var statusColor: Color {
		switch model.status {
		case .healthy:
			return .healthyStatusBackground
		case .deteriorating:
			return .deterioratingStatusBackground
		case .critical:
			return .criticalStatusBackground
		case .dead:
			return .deadStatusBackground
		}
	}

	var body: some View {
		HStack {
			Image(model.imageName)
				.resizable()
				.scaledToFit()
				.frame(width:120)
				.padding(.horizontal, 15)
			
			VStack(alignment: .leading) {
				Text(model.name)
					.font(.system(size: 20, weight: .bold))
					.foregroundColor(.itemTitle)
					.padding(.top)
				Text(model.location)
					.font(.system(size: 12, weight: .regular))
					.foregroundColor(.itemSubtitle)
					.padding(.bottom)
				
				Spacer()
				Text(model.status.rawValue)
					.font(.system(size: 12, weight: .bold))
					.foregroundColor(.font.opacity(0.75))
					.padding(.vertical, 6)
					.padding(.horizontal, 8)
					.background(
						RoundedRectangle(cornerRadius: 15)
							.foregroundColor(statusColor)
					)
				Spacer()
				
				let indicators = [
					(image: "Water", imageHeight: 30.0),
					(image: "Temperature", imageHeight: 25.0),
					(image: "Light", imageHeight: 40.0),
				]
				HStack(spacing: 20) {
					ForEach(indicators, id: \.self.image) { ind in
						Image(ind.image)
							.resizable()
							.foregroundColor(.buttonForeground)
							.scaledToFit()
							.frame(height: CGFloat(ind.imageHeight))
							.background(
								Circle().foregroundColor(.buttonBackground)
									.frame(width: 40, height: 40)
							)
							.frame(width: 40, height: 40)
					}
				}
				.padding(.bottom, 20)
			}
			Spacer()
		}
		.frame(height: 210)
		.background(
			Color.darkBackground.clipShape(
				RoundedCornersShape(
					radius: 30,
					corners: [.topLeft, .bottomLeft]
				)
			)
		)
		.padding([.leading, .bottom], 30)
	}
}

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListItemView(model: ModelData.plants[0])
    }
}
