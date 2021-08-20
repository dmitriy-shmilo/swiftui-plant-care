//
//  ToolbarView.swift
//  PlantCare
//
//  Created by Dmitriy Shmilo on 20.08.2021.
//

import SwiftUI

struct ToolbarView: View {
	var body: some View {
		HStack {
			Button(action: {}) {
				Image(systemName: "line.horizontal.3.circle")
					.foregroundColor(.font)
					.font(.system(size: 20))
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

struct ToolbarView_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarView()
    }
}
