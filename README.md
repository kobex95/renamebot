# renamebot

基于 [MadelineProto](https://docs.madelineproto.xyz) 的 Telegram 文件重命名机器人，支持 2GB+ 大文件在线处理，**不占用磁盘空间**。

## 快速安装

### 方法一：Docker 部署（推荐）

```bash
# 1. 克隆仓库
git clone https://github.com/kobex95/renamebot.git && cd renamebot

# 2. 配置环境变量
cp .env.example .env
# 编辑 .env，填入 BOT_TOKEN（从 @BotFather 获取）

# 3. 启动
docker compose up -d

# 4. 查看日志
docker compose logs -f
```

> 镜像自动推送到 [GHCR](https://github.com/kobex95/renamebot/pkgs/container/renamebot)：`ghcr.io/kobex95/renamebot:latest`

### 方法二：直接运行

```bash
wget https://github.com/kobex95/renamebot/raw/main/bot.php && php bot.php
```

需要安装依赖：**ffmpeg**、**yt-dlp**，以及 MadelineProto 的[运行环境要求](https://docs.madelineproto.xyz/docs/REQUIREMENTS.html)。

## 使用方法

| 命令 | 说明 |
|------|------|
| `/start` | 查看帮助 |
| `/upload <url> [文件名]` | 下载并上传文件/YouTube 视频 |
| 发送文件 | 触发重命名流程 |

## 环境变量

| 变量 | 必填 | 说明 |
|------|:--:|------|
| `BOT_TOKEN` | ✅ | 机器人令牌（@BotFather） |
| `API_ID` | ❌ | my.telegram.org 获取 |
| `API_HASH` | ❌ | my.telegram.org 获取 |
| `SESSION_DIR` | ❌ | 会话存储目录，默认 `.` |

## 数据持久化

Docker 部署时，会话文件保存在 `./data` 目录，重启/升级不丢失登录状态。

## 自动构建

推送代码到 `main` 或创建 `v*` 标签时，GitHub Actions 自动构建镜像并推送到 GitHub Container Registry，无需额外配置。
