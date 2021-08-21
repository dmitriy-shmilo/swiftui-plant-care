//
//  DetailsHeaderView.swift
//  PlantCare
//
//  Created by Dmitriy Shmilo on 21.08.2021.
//

import SwiftUI

struct DetailsHeaderView: View {
	var body: some View {
		Image("AloeVera")
			.resizable()
			.scaledToFit()
			.frame(height: 350)
			.transition(AnyTransition.move(edge: .trailing))
			.animation(.easeInOut)
		
		HStack {
			VStack (alignment: .leading) {
				Text("Aloe Vera")
					.font(.system(size: 35, weight: .bold))
					.foregroundColor(.itemTitle)
				Text("Living Room")
					.font(.system(size: 16, weight: .regular, design: .rounded))
					.foregroundColor(.itemSubtitle)
			}
			Spacer()
			Button(action: {}) {
				Image(systemName: "heart.circle.fill")
					.foregroundColor(.itemTitle)
					.font(.system(size: 60))
			}
		}
		.padding(.horizontal)
		.transition(AnyTransition.move(edge: .trailing))
		.animation(.easeInOut.delay(0.1))
	}
}

struct DetailsHeaderView_Previews: PreviewProvider {
	static var previews: some View {
		DetailsHeaderView()
	}
}
