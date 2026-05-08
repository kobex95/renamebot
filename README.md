# renamebot

Telegram file rename bot based on [MadelineProto »](https://docs.madelineproto.xyz).  

Download+reuploads are done on the fly, **no disk space is used**.

## Installation

```
wget https://github.com/kobex95/renamebot/raw/main/bot.php && php bot.php
```

Don't forget to install the [required dependencies](https://docs.madelineproto.xyz/docs/REQUIREMENTS.html) for MadelineProto, as well as **ffmpeg** and **yt-dlp**.

## Docker 部署（推荐）

### 前置要求
- 安装 [Docker](https://docs.docker.com/get-docker/) 和 [Docker Compose](https://docs.docker.com/compose/install/)
- 从 [@BotFather](https://t.me/BotFather) 获取 Bot Token
- （可选）从 [my.telegram.org](https://my.telegram.org/apps) 获取 API ID 和 API Hash

### 使用方法
1. 克隆仓库：
   ```bash
   git clone https://github.com/kobex95/renamebot.git
   cd renamebot
   ```

2. 创建 `.env` 文件并填写必要信息：
   ```ini
   BOT_TOKEN=你的机器人令牌
   API_ID=你的API_ID      # 可选
   API_HASH=你的API_HASH  # 可选
   ```

3. 启动容器：
   ```bash
   docker compose up -d
   ```

4. 查看日志：
   ```bash
   docker compose logs -f
   ```

### 数据持久化
会话文件存储在 `./data` 目录下，升级容器或重启不会丢失登录状态。

### 从源码构建
```bash
docker build -t renamebot .
docker run -e BOT_TOKEN=你的令牌 -v ./data:/app/data renamebot
```

### GitHub Actions 自动构建
本项目配置了 GitHub Actions 工作流，每当推送代码到 `main` 或 `master` 分支，或创建 `v*` 标签时，会自动构建 Docker 镜像并推送到 Docker Hub。

如需使用，请在仓库的 Secrets 中添加：
- `DOCKER_USERNAME`：你的 Docker Hub 用户名
- `DOCKER_PASSWORD`：你的 Docker Hub 密码或访问令牌

工作流文件位于 `.github/workflows/docker-publish.yml`。
