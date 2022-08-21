### 项目介绍

该项目主要使用Objective-C开发，完成了一个简化版的天气预报App，其核心功能如下：

- 展示当前天气、气温、风速、生活指数等信息，以及提供未来24小时、7天天气预报
- 具有定位、城市选择与搜索的功能
- 具备数据存储功能
- 背景可切换，提供动态和纯色两种背景

<img src="https://qiniu.dcts.top/typora/202208210228428.png" alt="image-20220821013846960" style="zoom:33%;" />

<img src="https://qiniu.dcts.top/typora/202208210228461.png" alt="image-20220821013903183" style="zoom:33%;" />



### 项目设计

本项目使用MVC架构，在Model的实现中参照这篇[博客](https://draveness.me/mvx-model/)，按照命令式组织Service层。Service层为每一个或一组API写一个专门用于Http请求的Mannager类，在Service中直接填充Model，在回调函数中返回。调用Service服务的Controller可以直接从回调中使用构建好的Model对象。

![img](https://bytedancecampus1.feishu.cn/space/api/box/stream/download/asynccode/?code=NzI2YzZkZjZmOTAxN2RkYmExMWNmODAxMDM2MjQxM2JfMTYxeVJFMXcxVHRSNkd1M3Fnd21XVTRORjh6OWhLZGNfVG9rZW46Ym94Y25jTDljZnc1Z3VPbHY2MXYwWlhLRUhjXzE2NjEwMjA2Nzc6MTY2MTAyNDI3N19WNA)

![image-20220821021618951](https://qiniu.dcts.top/typora/202208210228476.png)



详细文档可以查看 https://bytedancecampus1.feishu.cn/docx/doxcnjdYTBjVomnKMVquqLZ5Qyd
