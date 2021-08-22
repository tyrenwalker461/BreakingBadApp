import SwiftUI
import SDWebImageSwiftUI

struct ShowsView: View {
    
    @ObservedObject var showViewModel = ShowViewModel()
    
    let columns = [
        GridItem(.flexible(minimum: 100, maximum: 200), spacing: 16),
        GridItem(.flexible(minimum: 100, maximum: 200), spacing: 16),
        GridItem(.flexible(minimum: 100, maximum: 200), spacing: 16)
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, content: {
                    ForEach(showViewModel.shows) { show in
                        
                        NavigationLink(
                            destination: TVShowDetailView(tvShow: show),
                            label: {
                                WebImage(url: show.image.medium)
                                    .resizable()
                                    .indicator(.activity)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 150)
                                    .cornerRadius(8)
                            })
                    }
                })
                .padding()
            }
            .navigationTitle("TV Shows")
            .onAppear(perform: {
                showViewModel.fetchTVShows()
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ShowsView()
    }
}
