
import SwiftUI

struct EpisodeView: View {
    @State var series = [bbEpisodes]()
    
    var body: some View {
        NavigationView{
        List{
            ForEach(series){ user in
    
                VStack(alignment: .leading){
                HStack(
                    alignment: .top,
                    spacing: 5
                ){
                Section(header: Text("Season #")) {
                    Text(user.season)
                                }
                }
                HStack(
                        alignment: .top,
                        spacing: 5
                    ){
                    Section(header: Text("Episode #")) {
                        Text(user.episode)
                }
                }
                Text(user.title)
        
                }
               
            }
            .listRowBackground(Color.orange)
            
        }
        .navigationTitle("Episodes")
        
}
       
        .onAppear(perform: {
            let url = URL(string: "https://www.breakingbadapi.com/api/episodes")!
            URLSession.shared.dataTask(with: url) { data, response, networkingError in
                if let networkingError = networkingError{
                    print(networkingError.localizedDescription)
                }
                else {
                    if let data = data {
                        let decoder = JSONDecoder()
                        do{
                           let series = try decoder.decode([bbEpisodes].self, from: data)
                            self.series = series
                        } catch {
                            print(error.localizedDescription)
                        }
                        
                    }
                }
            }.resume()
        })
}
}

struct EpisodesView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeView()
    }
}

struct bbEpisodes: Decodable, Identifiable{
    var id: Int
    var title: String
    var season: String
    var episode: String
    
    enum CodingKeys: String, CodingKey{
        case id = "episode_id"
        case title = "title"
        case season = "season"
        case episode = "episode"
       }
}
//cant seem to put orange color on outter edges
