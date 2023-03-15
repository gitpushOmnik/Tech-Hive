import Foundation

class NetworkManager: ObservableObject{
    
    @Published var posts = [Post]()
    var url = "https://hn.algolia.com/api/v1/search?tags=front_page"
    
    func getData(){
        if let url = URL(string: url){
            let urlSession = URLSession(configuration: .default)
            let task = urlSession.dataTask(with: url) { data, urlResponse, error in
                if(error != nil){
                    print(error!)
                }else{
                    if let safeData = data{
                        let decoder = JSONDecoder()
                        do{
                            let decodedData = try decoder.decode(Posts.self, from: safeData)
                            self.posts = decodedData.hits
                        } catch{
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
