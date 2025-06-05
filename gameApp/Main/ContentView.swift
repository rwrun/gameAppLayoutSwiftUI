//error nil

import SwiftUI

struct ContentView: View {
    var users: [String] = [
        "face1",
        "face2",
        "face3",
        "face4",
    ]
    @State var selectedUser = "face1"
    var body: some View {
        ZStack(alignment: .top){
            HeaderView()
                .padding(.horizontal, 25)
                .zIndex(1)
                .background(.appPurple)
            ScrollView(showsIndicators: false){
                VStack(alignment: .leading, spacing: 20) {
                    
                    VStack(alignment: .leading, spacing: 20){
                        VStack(alignment: .leading, spacing: 18){
                            ContentHeader()
                            
                            HStack{
                                Text("Popular Streams")
                                    .font()
                                Spacer()
                                Button {
                                    //
                                } label: {
                                    Image(systemName: "chevron.right")
                                        .foregroundStyle(.black)
                                }

                            }
                        }
                        .padding(.horizontal, 25)
                        
                        HStack(spacing: 0){
                            CapsuleButton(text: "Valorant")
                            CapsuleButton(text: "CS:GO")
                            CapsuleButton(text: "Fifa 23")
                            CapsuleButton(text: "More", isMoreBtn: true)
                        }
                        .padding(.horizontal, 25)
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(StreamItem.mockData()) { item in
                                StreamItemView(item: item)
                            }
                            
                        }
                        .padding(.horizontal, 25)
                    }
                    
                    HStack{
                        Text("MyStreams")
                            .font()
                        Spacer()
                        Button {
                            //
                        } label: {
                            Image(systemName: "chevron.right")
                                .foregroundStyle(.black)
                        }

                    }
                    .padding(.horizontal, 25)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 0){
                            ForEach(users, id: \.self) { user in
                                StremUserMore(user: user, selectedUser: $selectedUser)
                            }
                        }
                        .padding(.horizontal, 25)
                    }
                }
                .padding(.top, 70)
            }
        }
        .background(.appPurple)
    }
}

#Preview {
    ContentView()
}


struct HeaderView: View {
    var body: some View {
        HStack{
            Button {
                print(1)
            } label: {
                Image(.menu)
                    .resizable()
                    .frame(width: 30, height: 30)
            }
            
            Spacer()
            HStack(spacing: 12){
                HStack(spacing: 0){
                    CircleButton(image: Image(.image2))
                    CircleButton(image: Image(systemName: "bell"), isNotify: true, notifyNumber: 5)
                }
                
                Button {
                    print(2)
                } label: {
                    Image(.face1)
                        .setCircle(size: 44, isCircle: true)
                }

            }
            

        }
    }
}
struct CircleButton: View {
    var size: CGFloat = 44
    var image: Image
    var isNotify: Bool = false
    var notifyNumber: Int = 0
    var body: some View {
        Button {
            print(3)
        } label: {
            ZStack{
                Circle()
                    .fill(.black)
                    .frame(width: size, height: size)
                image
                    .setCircle(size: 14)
                    .foregroundStyle(.white)
            }
            .overlay(alignment: .topTrailing) {
                if isNotify {
                    ZStack {
                        Circle()
                            .fill(.white)
                            .frame(width: 24, height: 24)
                        Text(notifyNumber.description)
                            .foregroundStyle(.black)
                            .font(size: 10)
                    }
                    .offset(x: 6, y: -6)
                }
                
            }
        }

       
    }
}
struct ContentHeader: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Text("👋 Hello Mathew")
                .font(size: 12)
            Text("Best Streams \nIn One Place")
                .font(size: 50)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct CapsuleButton: View {
    var text: String
    @State private var isSelected: Bool = false
    var isMoreBtn: Bool = false
    var countText: String = "+48"
    var body: some View {
        Button {
            isSelected.toggle()
        } label: {
            HStack(spacing: 5){
                if isMoreBtn {
                    Text(countText)
                        .font(size: 12)
                        .foregroundStyle(.white)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 12)
                        .background(
                            Capsule()
                                .foregroundStyle(.black)
                        )
                }
                Text(text)
                    .font(size: 14)
                    .foregroundStyle(isSelected ? .white : .black)
            }
            .padding(.vertical, isMoreBtn ? 4 : 10)
            .padding(.leading, isMoreBtn ? 5 : 15)
            .padding(.trailing, 15)
            .background(
                Capsule()
                    .fill(isSelected ? .black : .clear)
                    .stroke(Color.black, lineWidth: 1)
            )
            
        }

        
    }
}

struct StreamItem: Identifiable{
    let id = UUID()
    let viewers: String
    let image: String
    let text: String
    let teamName: String
    let userImg: String
    
    static func mockData() -> [StreamItem]{
       [
        StreamItem(viewers: "", image: "", text: "", teamName: "", userImg: ""),
        StreamItem(viewers: "", image: "", text: "", teamName: "", userImg: ""),
        StreamItem(viewers: "", image: "", text: "", teamName: "", userImg: "")
       ]
    }
}
struct StreamItemView: View {
    let item: StreamItem
    var body: some View {
        ZStack{
            VStack(spacing: 0){
                ZStack{
                    Image(.screen)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 140)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    VStack{
                        HStack{
                            HStack{
                                Image(systemName: "eye")
                                Text("9.4k")
                                    .font(size: 12)
                            }
                            .foregroundStyle(.white)
                            .padding(7)
                            .background(
                                Capsule()
                                    .fill(.darkBlue)
                            )
                            
                            Spacer()
                            Button {
                                //
                            } label: {
                                Image(.fire)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 15)
                                    .padding(7)
                                    .background(
                                        Circle()
                                            .foregroundStyle(.appPurple)
                                    )
                            }

                        }
                        Spacer()
                        HStack{
                            Spacer()
                            
                            Button {
                                //
                            } label: {
                                ZStack {
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 40, height: 40)
                                    Image(systemName: "line.diagonal.arrow")
                                        .foregroundStyle(.black)
                                        
                                }
                            }

                        }
                    }
                    .padding(7)
                    
                }
                VStack(alignment: .leading, spacing: 20){
                    Text("Astralis vs Vitally: Pro League Season 3")
                        .font()
                        .foregroundStyle(.white)
                    HStack{
                        HStack(spacing: 5){
                            Image(.face2)
                                .setCircle(size: 18)
                            Text("ESL_QWE")
                                .font(size: 13)
                                .foregroundStyle(.white)
                        }
                        Spacer()
                        Button {
                            //
                        } label: {
                            Image(.lineDott)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15)
                        }

                    }
                    
                }
                .padding(20)
            }
        }
        .frame(width: 220)
        .background(.darkBlue)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct StremUserMore: View {
    var user: String
    @Binding var selectedUser: String
    var body: some View {
        HStack{
            ZStack(alignment: .bottomTrailing){
                Image(user)
                    .setCircle(size: 55)
                if selectedUser == user{
                    ZStack{
                        Image(systemName: "checkmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 10)
                            .padding(5)
                            .background(
                                Circle()
                                    .fill(.white)
                                    .stroke(.darkBlue, lineWidth: 2)
                                    .frame(width: 20, height: 20)
                            )
                    }
                }
               
            }
            if selectedUser == user {
                VStack(alignment: .leading){
                    Text("loud_coringa")
                        .foregroundStyle(.white)
                        .font(size: 14)
                    Text("3.5m followers")
                        .foregroundStyle(.gray)
                        .font(size: 12)
                }
            }
            
        }
        .padding(.trailing, selectedUser == user ? 20 : 0)
        .background(.darkBlue)
        .clipShape(.capsule)
        .onTapGesture {
            withAnimation {
               selectedUser = user
            }
        }
    }
}

extension Image{
    func setCircle(size: CGFloat, isCircle: Bool = true) -> some View{
        self
            .resizable()
            .scaledToFit()
            .frame(width: size, height: size)
            .clipShape(RoundedRectangle(cornerRadius: isCircle ? size/2 : 0))
    }
}
