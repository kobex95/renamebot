FROM php:8.2-cli AS builder

# 安装系统依赖和工具
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    ffmpeg \
    yt-dlp \
    bash \
    && rm -rf /var/lib/apt/lists/*

# 安装PHP扩展
RUN docker-php-ext-install mbstring fileinfo

# 安装 Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /app

# 复制 composer 文件并安装依赖
COPY composer.json composer.lock* ./
RUN composer install --no-dev --no-interaction --optimize-autoloader

# 复制源代码
COPY . .

# 设置时区（可选，建议与宿主机一致）
ENV TZ=Asia/Shanghai

# 创建数据目录并设置权限
RUN mkdir -p /app/data && chmod 777 /app/data

# 健康检查（可根据实际情况调整）
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
  CMD php -r "exit(0);"

CMD ["php", "bot.php"]
