
# 基于超轻量Alpine基础镜像
FROM alpine:3.20
# 安装Node.js和npm，无缓存减少体积
RUN apk add --update --no-cache nodejs npm
# 设置工作目录
WORKDIR /app
# 先复制依赖文件，最大化利用Docker构建缓存
COPY package*.json ./
# 仅安装生产环境依赖
RUN npm install --production
# 复制项目剩余代码
COPY . .
# 暴露服务端口（按需修改）
EXPOSE 3000
# 启动Node.js应用
CMD ["node", "index.js"]
