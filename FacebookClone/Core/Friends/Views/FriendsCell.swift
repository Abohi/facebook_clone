

import SwiftUI
//import Kingfisher

struct FriendsCell: View {
    private var title: String
    private var imageName: String
    init(title: String, imageName: String) {
        self.title = title
        self.imageName = imageName
    }
    var body: some View {
        HStack(alignment: .top) {
            ZStack {
                Image("no-profile")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 70, height: 70)
                    .clipShape(Circle())
//                KFImage(URL(string: imageName))
//                    .resizable()
//                    .scaledToFill()
//                    .frame(width: 70, height: 70)
//                    .clipShape(Circle())
            }
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .fontWeight(.semibold)
                HStack {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Confirm")
                            .foregroundStyle(.white)
                            .frame(width: 120, height: 32)
                            .background(.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        Text("Delete")
                            .foregroundStyle(.black)
                            .frame(width: 120, height: 32)
                            .background(Color(.systemGray5))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    })
                }
                
            }
        }
    }
}
