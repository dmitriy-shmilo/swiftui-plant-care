//
//  DetailsView.swift
//  PlantCare
//
//  Created by Dmitriy Shmilo on 20.08.2021.
//

import SwiftUI

struct DetailsView: View {
	
	@State var hasAppeared = false
	
	var body: some View {
		ScrollView {
			VStack {
				DetailsToolbarView()
					.padding()
					.padding(.top, 30)
				
				if hasAppeared {
					DetailsHeaderView()
					
					
					Text("Plant Care")
						.font(.system(size: 18, weight: .semibold, design: .rounded))
						.foregroundColor(.itemTitle)
						.padding(.vertical)
						.transition(AnyTransition.move(edge: .trailing))
						.animation(.easeInOut.delay(0.2))
					
					PlantCareView()
				}
			}
			.background(
				RoundedRectangle(cornerRadius: 30)
					.foregroundColor(.darkBackground)
					.offset(x: 0, y: 370))
		}
		.background(Color.darkBackground.offset(x: 0, y: 400))
		.ignoresSafeArea()
		
		.navigationBarHidden(true)
		.onAppear {
			withAnimation {
				hasAppeared = true
			}
		}
		.onDisappear {
			hasAppeared = false
		}
	}
}

struct DetailsView_Previews: PreviewProvider {
	static var previews: some View {
		DetailsView()
	}
}
