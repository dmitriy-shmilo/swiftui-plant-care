//
//  ListItemView.swift
//  PlantCare
//
//  Created by Dmitriy Shmilo on 20.08.2021.
//

import SwiftUI

struct ListItemView: View {
	let model: Plant
	
	
	@Environment(\.safeAreaInsets) var safeAreaInsets: EdgeInsets
	
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
							.foregroundColor(.statusBackgroundColor(status: model.status))
					)
				Spacer()
				
				let indicators = [
					(image: "Water", imageHeight: 30.0, vitals: model.water),
					(image: "Temperature", imageHeight: 25.0, vitals: model.temperature),
					(image: "Light", imageHeight: 40.0, vitals: model.light),
				]
				HStack(spacing: 20) {
					ForEach(indicators, id: \.self.image) { ind in
						VitalsIcon(
							imageName: ind.image,
							imageHeight: CGFloat(ind.imageHeight),
							backgroundColor:
								.statusBackgroundColor(
									status: ind.vitals.status
								)
							.opacity(0.5))
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
		.padding(.leading, safeAreaInsets.leading + 32)
	}
}

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListItemView(model: ModelData.plants[0])
    }
}
