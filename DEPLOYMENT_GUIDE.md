# 上线步骤指南

下面这条路线最适合新手：使用 GitHub Pages 免费上线你现在这个静态站。你不需要买服务器，也不需要复杂配置。

## 第 1 步：准备一个 GitHub 账号
1. 打开 https://github.com
2. 注册或登录账号
3. 确认你已经能正常访问 GitHub

## 第 2 步：把这个网站文件上传到 GitHub
1. 在 GitHub 页面右上角点 New repository
2. 仓库名可以叫做 crystal-jewelry-site
3. 选择 Public
4. 点击 Create repository
5. 在本地电脑里打开这个文件夹：C:\Users\zxr\Documents\crystal-jewelry-site
6. 把里面的文件上传到刚创建的仓库

如果你不会上传，可以先把这个文件夹里的内容全部复制，然后在 GitHub 仓库页面点 Add files > Upload files

## 第 3 步：启用 GitHub Pages
1. 进入你刚创建的 GitHub 仓库
2. 点击 Settings
3. 在左侧找到 Pages
4. 在 Source 里选 GitHub Actions
5. 保存

## 第 4 步：让自动部署生效
仓库里已经准备好了自动部署文件：
- .github/workflows/deploy.yml

当你把文件提交到 main 分支后，GitHub 会自动开始部署。

## 第 5 步：等待部署完成
1. 进入 Actions 页面
2. 看一下部署任务是否成功
3. 成功后，你就能在 Pages 页面看到站点地址

一般地址会像下面这样：
https://你的用户名.github.io/你的仓库名/

## 第 6 步：访问你的网站
打开你得到的地址，就能看到上线后的页面。

## 第 7 步：后续怎么继续优化
上线后你可以继续做这些事情：
- 换成你的品牌名称
- 改成你自己的产品图片
- 加上微信或 WhatsApp
- 增加关于我们、常见问题、下单说明

## 你现在最需要做的就是
1. 把这个文件夹上传到 GitHub
2. 打开 Settings > Pages
3. 选择 GitHub Actions
4. 等部署完成

如果你愿意，我下一步可以继续直接带你做“如何把这个本地文件夹上传到 GitHub 的具体操作”。
