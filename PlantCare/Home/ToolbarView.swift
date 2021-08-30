//
//  ToolbarView.swift
//  PlantCare
//
//  Created by Dmitriy Shmilo on 20.08.2021.
//

import SwiftUI

struct ToolbarView: View {
	@Environment(\.safeAreaInsets) var safeAreaInsets: EdgeInsets
	
	var body: some View {
		HStack {
			Button(action: {}) {
				Image(systemName: "line.horizontal.3.circle")
					.foregroundColor(.font)
					.font(.system(size: 20))
			}
			.padding(.top, safeAreaInsets.top + 16)
			.padding(.bottom, 16)
			.padding(.leading, safeAreaInsets.trailing + 16)
			
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
			.padding(.top, safeAreaInsets.top + 16)
			.padding(.bottom, 16)
			.padding(.trailing, safeAreaInsets.trailing + 16)
		}
		.background(Color.init(white: 1.0, opacity: 0.5))
	}
}

struct ToolbarView_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarView()
    }
}
