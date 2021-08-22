
import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            ShowsView()
                .tabItem{
                    Label("Characters",systemImage: "person.3" )
                }
            EpisodeView()
                .tabItem{
                    Label("Episodes",systemImage: "list.number" )
                }
        }
        .onAppear() {
            UITabBar.appearance().barTintColor = .white
        }
        .accentColor(.black)
        }
    }

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
