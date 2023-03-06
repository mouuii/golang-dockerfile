#源镜像
FROM golang:latest
#作者
MAINTAINER Razil "test2022@163.com"
## 在docker的根目录下创立相应的应用目录
RUN mkdir -p /www/webapp
## 设置工作目录
WORKDIR /www/webapp
## 把以后（宿主机上）目录下的文件都复制到docker上刚创立的目录下
COPY . /www/webapp
#将服务器的go工程代码退出到docker容器中
#ADD . $GOPATH/src/github.com/mygohttp
#go构建可执行文件
RUN go build main.go
#裸露端口
EXPOSE 8080

RUN chmod +x main
ENTRYPOINT ["./main"]

## 启动docker须要执行的文件
#CMD go run main.go
#最终运行docker的命令
#ENTRYPOINT  ["./mygohttp"]