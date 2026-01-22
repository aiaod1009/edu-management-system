@Entry
@Component
export struct Mine {
  @Builder
  Builder(img: string, text: string) {
    Row({space: 10}) {
      Image($r('app.media.' + img))
        .width(25)
        .height(25)
        .margin({left: 10})
      Text(text)
        .fontSize(18)
      Image($r('app.media.right_grey'))
        .width(15)
        .height(15)
        .margin({left: 185})
    }
    .backgroundColor('rgba(255, 255,255,0.8)')
    .width('100%')
    .height(60)
    Divider()
      .color('#E0E0E0')
      .strokeWidth(1)
      .width('100%')
  }

  build() {
    Stack() {
      // 底层：全屏背景图
      Image($r('app.media.mineBg'))
        .width('100%')
        .height('100%')
        .objectFit(ImageFit.Cover)

      Column({space: 15}) {
          Row({space: 20}) {
            Image($r('app.media.account'))
              .width(50)
              .height(50)
            Column({space: 5}) {
              Text('Mr.Cai')
                .fontSize(20)
                .fontColor(Color.Black)
              Text('3449508132@qq.com')
                .fontSize(14)
            }
             .alignItems(HorizontalAlign.Start)
          }
          .padding({left: 15, right: 10})
          .backgroundColor('rgba(255, 255,255,0.8)')
          .width('100%')
          .height(100)
          .borderRadius(12)

        Column() {
          this.Builder('news', '推送通知')
          this.Builder('data', '数据管理')
          this.Builder('menu', '菜单设置')
          this.Builder('about', '关于')
          this.Builder('storage', '清楚缓存')
          this.Builder('privacy', '隐私协议')
        }
        .width('100%')
        // .height('100%')
        .backgroundColor('rgba(255, 255, 255, 0.8)')  // 添加背景色
        .borderRadius(12)  // 设置圆角

        Button('退出登录', {
          type: ButtonType.Capsule //胶囊
        })
          .width('90%')
          .height(40)
          .fontSize(17)
          .fontWeight(FontWeight.Medium)
          .fontColor('rgba(253, 54, 54, 0.8)')
          .backgroundColor('rgba(255, 255,255,0.8)')
          .margin({top: 70})

      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .padding({
        left: 10,
        right: 10,
        top: 20,
        bottom: 20
      })
    }
  }
}
