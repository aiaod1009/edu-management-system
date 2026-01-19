// 公共的数据结构（接口）（规范）
// 定义轮播图数据模型接口
export interface pictureItem {
  // Simg: 图片资源路径
  // 冒号后面加的是类型，还有string字符串，number数字类型，放在midea里面类型固定
  Simg: ResourceStr,
  // id: 唯一标识符，用做渲染时候的key
  id: number
}

// 定义功能宫格（热门图书、校园公告等）的数据模型接口
export interface othersItem {
  // img: 功能项显示的图片资源
  img: ResourceStr
  // title:功能项显示的标题文字
  title: string
}

// 定义推荐课程列表项数据模型接口
export interface listItem {
  img: ResourceStr
  title: string
  // 课程简介，描述
  text: string
}

// 我的页面设置列表项的数据模型接口
export interface setItem {
  //设置左侧的图标资源
  img: ResourceStr
  title: string
  // 可选属性(?表示该字段为可选)
  // 用于标记特殊状态，例如值为‘开关’时显示 Toggle 组件，否则显示默认箭头
  textF?: string
}
























