#                CSNavigationBarWithScrollTitle
##              模仿掌上英雄联盟v4.60版本资讯的滚动标题
=======

##介绍
这是一个在navgationBar中实现滚动的titleDemo。  

##应用场景
- 今日头条的title  
- 掌上英雄联盟的资讯页。此demo的素材就是来自掌上英雄联盟(表示感谢)。  
- 新闻类应用  


##展示图片

![demoImage](/media/demo_image.png "滚动title")

##展示gif
![](/image/demo_gif.gif)



##实现思路
```
1、整个资讯界面是一个UIViewController,在整个控制器里添加一个UICollectionView。  
    UICollectionView的item尺寸设置成中间View的大小。
2、资讯页的NavigationBar是一个自定义的View覆盖上去的。  
    自定义的VieW里同样放一个UICollectionView，item里放UILabel或则UIButton都可以。同时添加到：self.navigationController.view
3、右上角的箭头是一个UIButton，添加到：self.navigationController.view

```
## 可以通过clone下载Demo

    git clone --recursive https://github.com/chenaiwubu/CSNavigationBarWithScrollTitle.git

## Licenses

All source code is licensed under the [MIT License](/LICENSE).