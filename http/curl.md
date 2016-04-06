常用curl命令

1: 发送一个POST请求

```
curl -X POST http://xxxx.com
```

2: 只查看返回的header信息

```
curl -I http://xxxx.com
```
如果查看body的信息，使用 `-i`

3: 自动跳转，用于处理3XX状态码。

```
curl -L http://xxxx.com
```
