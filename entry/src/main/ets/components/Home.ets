@Entry
@Component
export struct Home {
  @Builder
  GridItemBuilder(img: Resource, text: string) {
    GridItem() {
      Column({space: 3}) {
        Image(img)
          .width(25)
          .height(25)
        Text(text)
          .fontSize(13)
      }
      .padding({top: 8})
    }
}
  @Builder
  GridItemBuilder1(img: Resource, text: string) {
    GridItem() {
      Column({space: 3}) {
        Image(img)
          .width(25)
          .height(25)
        Text(text)
          .fontSize(13)
      }
      .padding({bottom: 8})
    }
  }
  @Builder
  GridItemBuilder2(img: Resource, text: string, content: string) {
    GridItem() {
      Stack() {
        Image(img)
          .width('100%')
          .height('100%')
          .borderRadius(12)
        Column() {
          Text(text)
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin ({
              top: -22,
              left: 4,
              bottom: 8
            })
          Text(content)
            .fontSize(10)
            .margin({left: 4})
        }
        .alignItems(HorizontalAlign.Start)
      }
    }
  }

  build() {
    Scroll() {
      Column() {
        Column({space: 12}) {
          // 1. 轮播图部分
          Swiper() {
            Image($r('app.media.fig1'))
            Image($r('app.media.fig2'))
            Image($r('app.media.fig3'))
            Image($r('app.media.fig4'))
          }
          .borderRadius(16) // 圆角
          .width('100%')
          .height('200')
          .autoPlay(true)
          .interval(3000)// 间隔
          .vertical(false) // 垂直滚动
          .loop(true) // 循环

          //  2.宫格部分
          Grid() {
            this.GridItemBuilder($r('app.media.love'), '热门图书')
            this.GridItemBuilder($r('app.media.record'), '校园期刊')
            this.GridItemBuilder($r('app.media.message'), '校园公告')
            this.GridItemBuilder($r('app.media.jiangzuo'), '专家讲座')
            this.GridItemBuilder1($r('app.media.target'), '我的课程')
            this.GridItemBuilder1($r('app.media.grounp'), '我的小组')
            this.GridItemBuilder1($r('app.media.luntan'), '论坛咨询')
            this.GridItemBuilder1($r('app.media.favorite'), '华南党建')
          }
          .backgroundColor('rgba(255, 255, 255, 0.7)')
          .height(120)
          .rowsTemplate('1fr 1fr')
          .columnsTemplate('1fr 1fr 1fr 1fr')
          .rowsGap(10)
          .borderRadius(16)

          // 3
          Grid() {
            this.GridItemBuilder2($r('app.media.found1'), 'ArkTs核心语法', 'ArkTS核心语法全揭秘，新手也能写出专业级鸿蒙应用!')
            this.GridItemBuilder2($r('app.media.found2'), 'AI/LLM算法','LLM开发工程师入行实战--从0到1开发轻量化私有大模型')
            this.GridItemBuilder2($r('app.media.found3'), 'Python开发','Python操作三大主流模型数据库实战-网易新闻客户端')
            this.GridItemBuilder2($r('app.media.found1'), 'Java后端开发','系统学习Java网络编程 深度理解BIO/NIO/AIO')
            this.GridItemBuilder2($r('app.media.found1'), '软考通关宝典','打下坚实的知识基础，为考试铺路')
            this.GridItemBuilder2($r('app.media.found4'), '物联网/嵌入式','掌握编程思想，打造物联网 / 嵌入式核心能力')
          }
          .height(380)
          .width('100%')
          .rowsTemplate('1fr 1fr 1fr')
          .columnsTemplate('1fr 1fr')
          .rowsGap(12)
          .columnsGap(10)
        }
        .width('100%')
        // .height('100%')
        .padding({
          top: 10,
          left: 15,
          right: 15
        })
        .alignItems(HorizontalAlign.Center)
      }
      .padding({top: 10, bottom: 20})
      .backgroundImage($r('app.media.mineBg'))
      .backgroundImageSize({width: '100%', height: '100%'})
    }
    .scrollBar(BarState.Off)
  }
}