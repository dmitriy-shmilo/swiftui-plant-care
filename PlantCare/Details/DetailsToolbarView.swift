//
//  DetailsToolbarView.swift
//  PlantCare
//
//  Created by Dmitriy Shmilo on 20.08.2021.
//

import SwiftUI

struct DetailsToolbarView: View {
	@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
	
	var body: some View {
		HStack {
			Button(action: {
				presentationMode.wrappedValue.dismiss()
			}) {
				Image(systemName: "arrow.left.circle")
					.foregroundColor(.font)
					.font(.system(size: 30))
			}
			Spacer()
			Button(action: {}) {
				Image("Profile")
					.resizable()
					.frame(width: 40, height: 40)
					.overlay(
						RadialGradient(
							gradient: Gradient(
								colors: [
									.black.opacity(0), .black.opacity(0.3)
								]),
							center: .center,
							startRadius: 10,
							endRadius: 25
						)
					)
					.clipShape(Circle())
			}
		}
	}
}

struct DetailsToolbarView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsToolbarView()
    }
}
