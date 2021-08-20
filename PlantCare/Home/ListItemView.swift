//
//  ListItemView.swift
//  PlantCare
//
//  Created by Dmitriy Shmilo on 20.08.2021.
//

import SwiftUI

struct ListItemView: View {
	var body: some View {
		HStack {
			Image("AloeVera")
				.resizable()
				.scaledToFit()
				.frame(width:120)
				.padding(.horizontal, 15)
			
			VStack(alignment: .leading) {
				Text("Aloe")
					.font(.system(size: 20, weight: .bold))
					.foregroundColor(.itemTitle)
					.padding(.top)
				Text("Living Room")
					.font(.system(size: 12, weight: .regular))
					.foregroundColor(.itemSubtitle)
					.padding(.bottom)
				
				Spacer()
				Text("Healthy")
					.font(.system(size: 12, weight: .bold))
					.foregroundColor(.statusForeground)
					.padding(.vertical, 6)
					.padding(.horizontal, 8)
					.background(RoundedRectangle(cornerRadius: 15).foregroundColor(.statusBackground))
				Spacer()
				
				HStack(spacing: 20) {
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
        ListItemView()
    }
}
