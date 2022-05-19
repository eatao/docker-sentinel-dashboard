# sentinel-dashboard docker image

### 基本用法
#### 1. pull
```
docker pull jiangore/sentinel-dashboard
```

#### 2. run
```
docker run -d \
--restart always \
--privileged=true \
--name sentinel-dashboard \
-p 8080:8080 \
jiangore/sentinel-dashboard \
```
浏览器访问：http://localhost:8080  
账号: sentinel  
密码: sentinel  
sentinel用法参见 [官网](https://github.com/alibaba/spring-cloud-alibaba/wiki/Sentinel 'sentinel')

#### 3. 自定义配置
```
docker run -d \
--restart always \
--privileged=true \
--name sentinel-dashboard \
-e USERNAME="admin" \
-e PASSWORD="123456" \
-e LOG_DIR="/opt/sentinel/logs/csp/" \
-e JAVA_OPTS="-Xmx512m -Xms512m" \
-e TIME_ZONE="Asia/Shanghai" \
-v /opt/logs:/opt/sentinel/logs/csp
-p 8080:8080 \
jiangore/sentinel-dashboard \
```

#### 4. 高级玩法
```
# 克隆仓库到本地
git clone git@github.com:eatao/docker-sentinel-dashboard.git
# 进入到目录docker-sentinel-dashboard, 自行build, 当前官网sentinel-dashboard版本是1.8.4
docker build -t sentinel-dashboard:1.8.4 .
# 指定版本build 
docker build -t sentinel-dashboard:1.8.3 --build-arg SENTINEL_DASHBOARD_VERSION=1.8.3 .
# 下面就可以参考步骤2、3运行一个容器了

```

#### END


