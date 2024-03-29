//
//  WeeklyPopulerCampingView.swift
//  BootCamping
//
//  Created by Deokhun KIM on 2023/01/18.
//

import SwiftUI

import Firebase
import SDWebImageSwiftUI

struct WeeklyPopulerCampingView: View {
    
    @EnvironmentObject var diaryStore: DiaryStore
    @EnvironmentObject var commentStore: CommentStore
    @EnvironmentObject var diaryLikeStore: DiaryLikeStore
    @EnvironmentObject var wholeAuthStore: WholeAuthStore
    
    var body: some View {
        VStack {
            Spacer()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    // 차단한 유저의 글을 제외하고 보여준다
                    ForEach(diaryStore.popularDiaryList.filter { !wholeAuthStore.currnetUserInfo!.blockedUser.contains($0.diary.uid) }, id: \.self) { item in
                        NavigationLink {
                            WeeklyDiaryDetailView(item: item)
                        } label: {
                            ZStack(alignment: .topLeading) {
                                PhotoCardFrame(image: item.diary.diaryImageURLs[0])
                                LinearGradient(gradient: Gradient(colors: [Color.bcBlack.opacity(0.3), Color.clear]),
                                               startPoint: .top, endPoint: .bottom)
                                    .cornerRadius(20)
                                PhotoMainStory(item: item.diary)
                            }
                            .modifier(PhotoCardModifier())
                        }
                    }
                }
            }
            
            Spacer()
            Divider()
        }
        .onChange(of: diaryStore.createFinshed) { _ in
            diaryStore.firstGetMyDiaryCombine()
            diaryStore.firstGetRealTimeDiaryCombine()
            diaryStore.mostLikedGetDiarysCombine()
        }
    }
}

//MARK: - 포토카드 프레임
struct PhotoCardFrame: View {
    
    var image: String
    
    var body: some View {
        WebImage(url: URL(string: image))
            .resizable()
            .placeholder {
                Rectangle()
                    .foregroundColor(.secondary)
                    .skeletonAnimation()
            }
            .indicator(.activity)
            .transition(.fade(duration: 0.5))
            .scaledToFill()
            .frame(width: UIScreen.screenWidth * 0.75, height: UIScreen.screenHeight * 0.7)
            .clipped()
            .cornerRadius(20)
            .overlay(alignment: .bottomTrailing, content: {
                HStack{
                    Text("자세히 보기")
                    Image(systemName: "chevron.right.2")
                }
                .shadow(radius: 10)
                .font(.subheadline)
                .foregroundColor(.white)
                .kerning(-0.7)
                .padding(20)
                .padding(.bottom, 30)
            })
    }
}

//MARK: - 포토카드 위 글씨
struct PhotoMainStory: View {
    
    @EnvironmentObject var wholeAuthStore: WholeAuthStore
    @EnvironmentObject var diaryStore: DiaryStore
    @StateObject var campingSpotStore: CampingSpotStore = CampingSpotStore()

    var item: Diary
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("\(item.diaryVisitedDate.getKoreanDate())")
                    .font(.subheadline)
                    .padding(.bottom, 0.01)
                    .padding(.top, 70)
                
                //캠핑장 정보 있을때만 화면에 나옴
                if campingSpotStore.campingSpotList.first?.facltNm != nil {
                    Text("\(campingSpotStore.campingSpotList.first?.facltNm ?? "")")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding(.bottom, UIScreen.screenHeight * 0.03)
                }
                
                Text(item.diaryTitle)
                    .font(.title)
                    .multilineTextAlignment(.leading)
                    .fontWeight(.bold)
                    .padding(.bottom, 0.01)
                HStack{
                    Text("by ")
                        .padding(.trailing, -5)
                    Text("\(item.diaryUserNickName)")
                        .bold()
                        .lineLimit(1)
                }
                .italic()
                .font(.subheadline)
            }
            .onAppear {
                campingSpotStore
                    .readCampingSpotListCombine(readDocument: ReadDocuments(campingSpotContenId: [item.diaryAddress]))
            }
            .foregroundColor(.white)
            .kerning(-0.7)
            .padding(.horizontal, 20)
        }
    }
}
