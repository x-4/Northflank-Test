# 直接使用官方预构建的node:xx-alpine镜像，无需手动装Node
FROM node:24-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install --production
COPY . .
EXPOSE 3000
CMD ["node", "index.js"]
