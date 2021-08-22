//
//  VitalsIcon.swift
//  PlantCare
//
//  Created by Dmitriy Shmilo on 22.08.2021.
//

import SwiftUI

struct VitalsIcon: View {
	let imageName: String
	let imageHeight: CGFloat
	let backgroundColor: Color
	
	var body: some View {
		Image(imageName)
			.resizable()
			.foregroundColor(.buttonForeground)
			.scaledToFit()
			.frame(height: CGFloat(imageHeight))
			.background(
				Circle().foregroundColor(backgroundColor)
				.frame(width: 40, height: 40)
			)
			.frame(width: 40, height: 40)
	}
}

struct VitalsIcon_Previews: PreviewProvider {
    static var previews: some View {
        VitalsIcon(imageName: "Water", imageHeight: 25, backgroundColor: .buttonBackground)
    }
}
