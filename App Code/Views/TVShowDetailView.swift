import SwiftUI
import SDWebImageSwiftUI

struct TVShowDetailView: View {
    
    var tvShow: TVShow
    var body: some View {
        Color.orange
        .ignoresSafeArea()
            .overlay(
        ScrollView {
            VStack(alignment: .leading) {
                WebImage(url: tvShow.img)
                    .resizable()
                    .indicator(.activity)
                    .aspectRatio(contentMode: .fit)
                VStack(alignment: .leading) {
                    Text(tvShow.name)
                        .font(.largeTitle)
                    Text(tvShow.nickname)
                        .font(.title2)
                        .foregroundColor(.secondary)
                    Spacer()
                        .frame(height:25)
                    Text("Status")
                        .font(.title2)
                    
                    Text(tvShow.status)
                        .font(.title3)
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal)
            }
            
        }
            )
    }
}
