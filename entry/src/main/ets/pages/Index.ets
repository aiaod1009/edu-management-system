// 导入首页组件
import { Home } from '../components/Home'
//导入“我的“页面组件
import { Mine } from '../components/Mine'

@Entry
@Component
struct Index {
  // 当 currentIndex 发生改变时，可以切换到对应组件
  @State currentIndex: number = 0

  // TabsController: 实现导航项的切换
  private tabsController: TabsController = new TabsController()

  @Builder
  TabBuilder(title: string, index: number, normalImg: Resource, selectedImg: Resource) {
    // 使用 Column 布局，让图标和文字垂直排列
    Column() {
      // 图标
      // 使用三目运算符判断：如果当前选中的索引等于该按钮的索引值，显示 selectImg，否则显示：normalImg
      Image(this.currentIndex === index? selectedImg : normalImg)
        .width(24)
        .height(24)
        .objectFit(ImageFit.Contain)   //保持原比例显示完整
        .margin({
          bottom: 4
        })
      Text(title)
        .fontSize(10)
        .fontWeight(500)
        .fontColor(this.currentIndex === index? '#ffe0b825' : '#99182431')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)  // 垂直居中
    .onClick(() => {
      // 点击事件处理
      // 1. 更新当前选中的索引状态
      this.currentIndex = index
      // 2. 通知控制器切换对应的视图
      this.tabsController.changeIndex(this.currentIndex)
    })
  }

  build() {
    Tabs({
      // 导航栏位置
      barPosition: BarPosition.End,
      // 控制器
      controller: this.tabsController
    }) {
      // 首页
      TabContent() {
        Home()
      }
      // 试图对应的导航项设置
      .tabBar(this.TabBuilder('首页', 0, $r('app.media.home'), $r('app.media.home_selected')))

      // 我的
      TabContent() {
        Mine()
      }
      // 试图对应的导航项设置
      .tabBar(this.TabBuilder('我的', 1, $r('app.media.mine'), $r('app.media.mine_selected')))
    }
    // 导航栏高度
    .barHeight(56)
    .padding({top: 8})
    // 导航栏模式
    .barMode(BarMode.Fixed)
    .barBackgroundColor(Color.White)
    .onChange((index: number) => {
      this.currentIndex = index
    })
    //也可以链式调用
    // .vertical(false)
    // .barPosition(BarPosition.End)
  }
}




























