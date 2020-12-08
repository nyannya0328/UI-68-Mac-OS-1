//
//  ImageViewModel.swift
//  UI-68
//
//  Created by にゃんにゃん丸 on 2020/12/08.
//

import SwiftUI

class ImageViewModel: ObservableObject {
    @Published var images : [ImageModel] = []
    
    init() {
        let url = "https://picsum.photos/v2/list"
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url)!) { (data, _, _) in
            guard let json = data else {return}
            
            do{
                
                let images = try JSONDecoder().decode([ImageModel].self, from: json)
                
                print(images)
                
                DispatchQueue.main.async {
                    self.images = images
                }
                
            }catch{
                
                
                print(error.localizedDescription)}
        }
        .resume()
    }
}


