//
//  VitalsButton.swift
//  PlantCare
//
//  Created by Dmitriy Shmilo on 22.08.2021.
//

import SwiftUI

struct VitalsButton: View {
	let imageName: String
	let imageHeight: CGFloat
	let backgroundColor: Color
	let action: () -> Void
	
	var body: some View {
		Button(action: action) {
			VitalsIcon(
				imageName: imageName,
				imageHeight: imageHeight,
				backgroundColor: backgroundColor
			)
		}
	}
}

struct VitalsButton_Previews: PreviewProvider {
    static var previews: some View {
		VitalsButton(imageName: "Water", imageHeight: 25, backgroundColor: .buttonBackground) {
		}
    }
}
