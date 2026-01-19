// @Extend 装饰器：封装公共的UI样式
// 这里封装了 TextInput 组件的公共样式
//好处：避免重写相同的代码块，提高代码的复用性
@Extend(TextInput)
function inputStyle() {
  .placeholderColor('#99182431')
  .height(50)  //默认用虚拟像素 vp 作为单位
  .width('100%')
  .fontSize(16)//等同于'16fp'
  .backgroundColor(Color.Transparent)
  .padding({
    left: 10
  })
}

// 装饰器：修饰下面的所有代码为入口组件
@Entry
// 装饰器：修饰下面的所有代码为组件
@Component
struct LoginPage {
  // @State: 让修饰的变量可以跟视图相关
  // 用户账户，默认值用于开发调试
  @State account: string = '13712345678'
  // 用户密码
  @State password: string = ''
  // 控制是否显示登陆中的加载进度圈
  @State isShowProgress: boolean = false
  // 定时器ID,在组件销毁时清除定时器，防止内存泄漏
  private timeOutID: number = -1
  //标记是否处于注册状态
  @State isRegister: boolean = false

  //模拟数据库中的账号密码
  @State paccount: string = '13622224444'
  @State ppassword: string = '123456'

  // UI构建器
  build() {
    // Stack: 层叠布局，子组件会层叠显示（用于实现背景图 + 内容的层叠效果）
    Stack() {
      // 底层：全屏背景图
      Image($r('app.media.mineBg'))
        .width('100%')
        .height('100%')
        .objectFit(ImageFit.Cover) // 保持原比例让图片覆盖整个容器
      // 中层: 磨砂玻璃遮罩
      // 用于虚化背景，提升前景文字的可读性
      Column()
        .width('100%')
        .height('100%')
        .backgroundColor('rgba(255, 255, 255, 0.3)')
        .backdropBlur(20)  //核心属性：背景模糊效果

      // 上层：主要内容区域
      Column() {
        // 1. Logo 图片
        Image($r('app.media.logo'))
          .width(400)
          .height(400)
          .margin({
            top: -60
          })
          .objectFit(ImageFit.Contain)  //保持原比例让图片显示完整（小图标）

        // 2. 欢迎标题
        Text('欢迎回来')
          .fontSize(28)
          .fontWeight(FontWeight.Bold)
          .fontColor('#182431')
          .margin({
            top: -40,
            bottom: 8
          })

        // 3. 副标题
        Text('登录以继续使用教务系统')
          .fontSize(14)
          .fontColor('#99182431')
          .margin({
            bottom: 40
          })

        // 4.登录表单区域（输入框容器）
        Column({
          space: 16
        }) {
          //账号输入框
          Row() {
            //账号图标
            Image($r('app.media.account'))
              .width(20)
              .height(20)
              .margin({
                right: 10
              })
              .fillColor('#666')

            //文本输入框
            TextInput({
              placeholder: '请输入账号',
              text: this.account
            })
              .layoutWeight(1)  // 尺寸权重
              .type(InputType.Number)  //设置输入框类型为数字
              .maxLength(11)  // 限制长度
              .inputStyle()  // 调用封装好的公共样式方法
              .onChange((value: string) => {
                this.account = value  // 双向绑定：输入值同步给状态变量
              })
          }
          .height(56)
          .padding({
            left: 16,
            right:16
          })
          .backgroundColor('rgba(255, 255, 255, 0.8)')
          .borderRadius(16)
          .width('90%')

          //密码输入框
          Row() {
            Image($r('app.media.privacy'))
              .width(20)
              .height(20)
              .margin({
                right: 10
              })
              .fillColor('#666')
            TextInput({
              placeholder: '请输入密码',
              text: this.password
            })
              .layoutWeight(1)
              .type(InputType.Password)
              .maxLength(16)
              .inputStyle()  // 调用封装好的公共样式方法
              .onChange((value: string) => {
                this.password = value // 双向绑定：输入值同步给状态变量
              })
          }
          .height(56)
          .padding({
            left: 16,
            right:16
          })
          .backgroundColor('rgba(255, 255, 255, 0.8)')
          .borderRadius(16)
          .width('90%')
        }
          // 5.辅助功能链接
          Row() {
            Text('短信验证码登录')
              .fontColor('#007DFF')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
            Text('忘记密码')
              .fontColor('#007DFF')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
          }
          .justifyContent(FlexAlign.SpaceBetween)
          .width('85%')
          .margin({
            top: 10,
            bottom: 32
          })

          // 6.登录按钮区域
        if (this.isShowProgress) {
          //如果正在登录，显示加载圈
          LoadingProgress()
            .color('#007DFF')
            .width(40)
            .height(40)
        } else {
          // 否则显示登录按钮
          Button('登录', {
            type: ButtonType.Capsule //胶囊
          })
            .width('85%')
            .height(50)
            .fontSize(18)
            .fontWeight(FontWeight.Medium)
            .backgroundColor('#007DFF')
            .shadow({
              // 阴影半径
              radius: 8,
              color: 'rgba(0, 125,255,0.3)',
              offsetY: 4
            })
            .onClick(() => {
              //触发登录
            })
        }
      }
    }
  }
}

