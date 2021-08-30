//
//  DetailsHeaderView.swift
//  PlantCare
//
//  Created by Dmitriy Shmilo on 21.08.2021.
//

import SwiftUI

struct DetailsHeaderView: View {
	let model: Plant
	let parentGeometry: GeometryProxy?

	@State private var isFavorite = false

	var body: some View {
		Image(model.imageName)
			.resizable()
			.scaledToFit()
			.padding(.bottom)
			.frame(height: 350)
			.transition(AnyTransition.move(edge: .trailing))
			.animation(.easeInOut)
			.background(
				VStack {
					Spacer()
					Ellipse()
					.fill(Color.black.opacity(0.3))
						.padding(.horizontal, 10)
						.frame(height: 80)
				}
			)
		
		HStack {
			VStack (alignment: .leading) {
				Text(model.name)
					.font(.system(size: 35, weight: .bold))
					.foregroundColor(.itemTitle)
				Text(model.location)
					.font(.system(size: 16, weight: .regular, design: .rounded))
					.foregroundColor(.itemSubtitle)
			}
			Spacer()
			Button(action: {
				withAnimation {
					isFavorite.toggle()
				}
			}) {
				if (isFavorite) {
					Image(systemName: "heart.fill")
						.foregroundColor(.itemTitle)
						.font(.system(size: 40))
						.transition(.scale)
						.animation(.easeIn)
				} else {
					Image(systemName: "heart")
						.foregroundColor(.itemTitle)
						.font(.system(size: 40))
						.transition(.scale)
						.animation(.easeIn)
				}
			}
		}
		.padding(.leading, (parentGeometry?.safeAreaInsets.leading ?? 0) + 16)
		.padding(.trailing, (parentGeometry?.safeAreaInsets.trailing ?? 0) + 16)
		.transition(AnyTransition.move(edge: .trailing))
		.animation(.easeInOut.delay(0.1))
	}
}

struct DetailsHeaderView_Previews: PreviewProvider {
	static var previews: some View {
		DetailsHeaderView(model: ModelData.plants[0], parentGeometry: nil)
	}
}
