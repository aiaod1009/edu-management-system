import promptAction from '@ohos.promptAction'
@Entry
@Component
export struct Mine {
  @State currentUserName: string = 'Mr.Cai'
  @State currentUserAvatar: Resource = $r('app.media.account')
  @State checkInToday: boolean = false
  @State continuousDays: number = 0
  @State showConfirmHint: boolean = false

  private avatarResources: Resource[] = [
    $r('app.media.buoumao'),
    $r('app.media.bianmu'),
    $r('app.media.chaiquan'),
    $r('app.media.jumao'),
    $r('app.media.kedaya'),
    $r('app.media.tianyuanquan')
  ]

  @Builder
  Builder(img: string, text: string) {
    Row({space: 10}) {
      Row(){
        Image($r('app.media.' + img))
          .width(25)
          .height(25)
          .margin({left: 15})
        Text(text)
          .fontSize(18)
          .margin({
            left: 10
          })
      }
      if (text == '推送通知') {
        Toggle({type: ToggleType.Switch})
          .selectedColor('#F4EBE2')           // 选中时的背景色
          .switchPointColor('#DCB888')        // 滑块颜色
          .margin({right: 18})
          .onClick(() => {
            promptAction.showToast({
              // 提示内容
              message: '已开启信息推送',
              // 停留时间
              duration: 2000,
              // 距离底部的距离
              bottom: 140
            })
          })
      }
      else {
        Image($r('app.media.right_grey'))
          .width(15)
          .height(15)
          .margin({right: 15})
      }
    }
    .width('100%')
    .height(60)
    .justifyContent(FlexAlign.SpaceBetween)
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
            Image(this.currentUserAvatar)
              .width(50)
              .height(50)
              .onClick(() => {
                // 随机选择一个头像资源
                const randomIndex = Math.floor(Math.random() * this.avatarResources.length)
                this.currentUserAvatar = this.avatarResources[randomIndex]
                promptAction.showToast({
                  message: '头像已更换',
                  duration: 100,
                  bottom: 140
                })
              })

            Column({space: 5}) {
              Text(this.currentUserName)
                .fontSize(20)
                .fontColor(Color.Black)
                .onClick(() => {
                  // 简单的账户名循环切换演示
                  const names = ['Mr.Cai', 'Mr.Zhang', 'Mr.Chen', 'Mr.Zhao', 'Mr.Li','Mr.Huang']
                  const currentIndex = names.indexOf(this.currentUserName)
                  const nextIndex = (currentIndex + 1) % names.length
                  this.currentUserName = names[nextIndex]
                  promptAction.showToast({
                    message: '账户名已更新为: ' + this.currentUserName,
                    duration: 2000,
                    // 距离底部的距离
                    bottom: 140
                  })
                })
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
        if(!this.checkInToday) {
          Button('点击签到 +1积分')
            .width('100%')
            .height(40)
            .fontSize(16)
            .fontColor(Color.White)
            .backgroundColor('#DCB888')
            .borderRadius(12)
            .onClick(() => {
              this.checkInToday = true
              this.continuousDays += 1
              promptAction.showToast({
                message: '签到成功！连续签到' + this.continuousDays + '天',
                duration: 1500,
                bottom: 140
              })
            })
        } else {
          Button('已签到 ✓')
            .width('100%')
            .height(40)
            .fontSize(16)
            .fontColor(Color.White)
            .backgroundColor('#ffb5b5b5')
            .borderRadius(8)
        }

        Column() {
          List() {
            ListItemGroup() {
              ListItem() { this.Builder('news', '推送通知') }
              ListItem() { this.Builder('data', '数据管理') }
              ListItem() { this.Builder('menu', '菜单设置') }
              ListItem() { this.Builder('about', '关于') }
              ListItem() { this.Builder('storage', '清楚缓存') }
              ListItem() { this.Builder('privacy', '隐私协议') }
            }
            .height(50)
            .width('100%')
            .divider({
              strokeWidth: 1,
              color: '#E0E0E0',
              startMargin: 40,
              endMargin: 30
            })
          }
        }
        .width('100%')
        // .padding({top: 10,bottom: 10})
        // .height('100%')
        .backgroundColor('rgba(255, 255, 255, 0.8)')  // 添加背景色
        .borderRadius(14)  // 设置圆角

        Button('退出登录', {
          type: ButtonType.Capsule //胶囊
        })
          .width('90%')
          .height(40)
          .fontSize(17)
          .fontWeight(FontWeight.Medium)
          .fontColor('rgba(253, 54, 54, 0.8)')
          .backgroundColor('rgba(255, 255,255,0.8)')
          .margin({top: 20})
          .onClick(() => {
            if (!this.showConfirmHint) {
              // 第一次点击：显示确认提示
              promptAction.showToast({
                message: '再次点击确认退出',
                duration: 1500,
                bottom: 140
              })
              this.showConfirmHint = true
            } else {
              // 第二次点击：执行退出
              this.getUIContext().getRouter().pushUrl({url:'pages/LoginPage'})
              promptAction.showToast({
                message: '已退出登录',
                duration: 2000,
                bottom: 80
              })
              this.showConfirmHint = false  // 重置状态
            }
          })

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
