// 1. 参考图片实现注册页面
// 2. 注册过的账号密码，点击注册按钮后跳转到登录页并且自动把账号密码填充到输入框中
// 3. 能使用注册过的账号密码正常登录

// 导入路由模块, 用于实现页面跳转
import { router } from '@kit.ArkUI'
// 导入弹窗模块
import promptAction from '@ohos.promptAction'

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

@Entry
@Component
struct RegisterPage {
  @State account: string = ''
  // 用户密码
  @State password: string = ''
  // 控制是否显示登陆中的加载进度圈
  @State confirmPassword: string = ''
  @State isShowProgress: boolean = false
  // 定时器ID,在组件销毁时清除定时器，防止内存泄漏
  private timeOutID: number = -1
  //标记是否处于注册状态
  @State isRegister: boolean = false
  // 添加模拟数据库状态变量
  @State paccount: string = '13622224444'
  @State ppassword: string = '123456'

  handleRegister() {


    if (this.account.length !== 11) {
      promptAction.showToast({
        message: '账号应为11位数字'
      })
      // 验证失败时隐藏加载圈
      this.isShowProgress = false
      return
    }

    if (this.password.length < 6) {
      promptAction.showToast({
        message: '密码至少6位'
      })
      // 验证失败时隐藏加载圈
      this.isShowProgress = false
      return
    }

    if (this.password !== this.confirmPassword) {
      promptAction.showToast({
        message: '两次输入的密码不一致'
      })
      return
    }
    // 验证通过后显示加载圈
    this.isShowProgress = true

    if (this.timeOutID === -1) {
      setTimeout(() => {
        // 更新模拟数据库
        this.paccount = this.account
        this.ppassword = this.password

        // 隐藏加载动画
        this.isShowProgress = false
        // 重置定时器ID
        this.timeOutID = -1

        // 注册成功的提示
        promptAction.showToast({
          message: '注册成功'
        })

        // 跳转到登录页并传递数据
        router.replaceUrl({
          url: 'pages/LoginPage',
          params: {
            account: this.account,
            password: this.password
          }
        }).catch((error: Error) => {
          console.error('路由跳转失败:', error.message)
        })
      }, 2000) // 2秒延迟模拟网络请求
    }
  }

  build() {
    Column({
      space: 12
    }) {
      // 1. Logo 图片
      Image($r('app.media.icon'))
        .width(80)
        .height(80)
        .margin({
          top: 40
        })
        .objectFit(ImageFit.Contain) //保持原比例让图片显示完整（小图标）

      // 2. 注册标题
      Text('注册页面')
        .fontSize(28)
        .fontWeight(FontWeight.Bold)
        .fontColor('#182431')
        .margin({
          top: 10,
          bottom: 8
        })

      // 3. 副标题
      Text('注册以登录教务系统')
        .fontSize(14)
        .fontColor('#99182431')
        .margin({
          bottom: 20
        })

      // 4. 账号输入框
      Row() {
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
            this.account = value // 双向绑定：输入值同步给状态变量
          })
          .height(56)
          .padding({
            left: 16,
            right: 16
          })
          .margin({
            left: 10,
            right: 10
          })
          .backgroundColor('rgba(255, 255, 255, 0.8)')
          .borderRadius(16)
          .width('100%')
          .shadow({
            radius: 8,
            color: '#33000000',
            offsetX: 10,
            offsetY: 10
          })
      }
      // 5. 密码输入框
      Row() {
        TextInput({
          placeholder: '请输入密码',
          text: this.password
        })
          .layoutWeight(1)
          .type(InputType.Password)
          .inputStyle()
          .onChange((value: string) => {
            this.password = value
          })
          .height(56)
          .padding({ left: 16, right: 16 })
          .margin({
            left: 10,
            right: 10
          })
          .backgroundColor('rgba(255, 255, 255, 0.8)')
          .borderRadius(16)
          .width('90%')
          .shadow({
            radius: 8,
            color: '#33000000',
            offsetX: 10,
            offsetY: 10
          })
      }
      // 6. 确认密码输入框
      Row() {
        TextInput({
          placeholder: '确认密码',
          text: this.confirmPassword
        })
          .layoutWeight(1)
          .type(InputType.Password)
          .inputStyle()
          .onChange((value: string) => {
            this.confirmPassword = value
          })
          .height(56)
          .padding({ left: 16, right: 16 })
          .margin({
            left: 10,
            right: 10
          })
          .backgroundColor('rgba(255, 255, 255, 0.8)')
          .borderRadius(16)
          .width('90%')
          .shadow({
            radius: 8,
            color: '#33000000',
            offsetX: 10,
            offsetY: 10
          })
      }

      // Button('注册', {
      //   type: ButtonType.Capsule
      // })
      //   .width('90%')
      //   .height(48)
      //   .backgroundColor('#007DFF')
      //   .borderRadius(16)
      //   .margin({ top: 20 })
      //   .onClick(() => {
      //     this.handleRegister()
      //   })
      if (this.isShowProgress) {
        // 显示加载圈
        LoadingProgress()
          .color('#007DFF')
          .width(40)
          .height(40)
      } else {
        // 显示注册按钮
        Button('注册', {
          type: ButtonType.Capsule
        })
          .width('90%')
          .height(48)
          .backgroundColor('#007DFF')
          .borderRadius(16)
          .margin({ top: 20 })
          .onClick(() => {
            this.handleRegister()
          })
      }

      Text('已有账号？返回登录')
        .fontSize(16)
        .fontColor('#007DFF')
        .fontWeight(FontWeight.Medium)
        .margin({
          top: 20
        })
        .onClick(() => {
          router.pushUrl({
            //目标路径
            url: 'pages/LoginPage'
          })
        })
      }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}