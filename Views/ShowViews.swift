import SwiftUI
import SDWebImageSwiftUI


struct ShowsView: View {
    @ObservedObject var showViewModel = ShowViewModel()
    
    let columns = [
        GridItem(.flexible(minimum: 100, maximum: 200), spacing: 16),
        GridItem(.flexible(minimum: 100, maximum: 200), spacing: 16),
        GridItem(.flexible(minimum: 100, maximum: 200), spacing: 16),
    ]
    var body: some View {
        NavigationView {
            Color.orange
            .ignoresSafeArea()
                .overlay(
            ScrollView {
                LazyVGrid(columns: columns, content: {
                    ForEach(showViewModel.shows) { show in
                        NavigationLink(
                            destination: TVShowDetailView(tvShow: show),
                            label: {
                                VStack(alignment: .center){
                                WebImage(url: show.img)
                                    .resizable()
                                    .indicator(.activity)
                                    .frame(height: 150)
                                    .cornerRadius(8)
                                    VStack(alignment: .leading){
                                        Text(show.nickname)
                                     
                                    }
                                }
                            }
                        )
                    }
                }
                )
                .padding()
            }
            )
            .navigationTitle("Breaking Bad Fans")
            .accentColor(.black)
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
