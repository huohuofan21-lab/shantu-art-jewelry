# 完全独立部署指南

如果你要的是“完全属于公司可管理资产、非第三方托管”的站点，最推荐做法是：

- 购买一台云服务器（阿里云 / 腾讯云 / 华为云 / AWS / DigitalOcean）
- 绑定自己的域名
- 在服务器上安装 Nginx
- 把静态文件部署到服务器目录
- 配置 HTTPS / SSL
- 由公司自己掌控源码、服务器和数据

## 推荐方案

### 方案 A：Linux VPS + Nginx（最推荐，适合新手）
适合你现在这个静态站。

1. 购买一台 VPS
   - 推荐配置：2 核 2G / 40G 磁盘以上
   - 系统选择 Ubuntu 22.04

2. 绑定域名
   - 解析 A 记录到服务器 IP

3. 连接服务器
   - 使用 SSH 登录

4. 安装 Nginx
   - 运行 server-setup.sh

5. 上传站点文件
   - 把 index.html / styles.css / script.js 上传到 /var/www/crystal-jewelry-site

6. 配置 HTTPS
   - 运行 certbot

## 服务器端目录

静态文件建议放在：

/var/www/crystal-jewelry-site

## 关键点

- 源码由你自己管理
- 服务器由你自己购买和管理
- 域名和证书由你自己控制
- 不依赖 GitHub Pages、Netlify、Vercel 等第三方托管服务

## 如果你想要更“企业化”

后面可以继续加上：
- 备份策略
- 防火墙规则
- 日志监控
- Docker 部署
- 内网/外网双线路
- CDN（可选）

如果你愿意，我下一步可以直接带你做“购买服务器后，如何一步步连上服务器并部署这个站点”。
