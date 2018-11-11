## 全局实体定义

### CommmonImage 实体

| 名称      | 类型      |  说明    |
| ----------| --------- | -------- |
| fileType | String | 图片文件扩展名 |
| thumb | String | 缩略图url |
| height | Number | 原尺寸高度 |
| width | Number | 原尺寸宽度 |
| url | String | 添加了最大魔图规则限制的(960x) 的 url |
| original | String | 原图url |

## 首页商品列表接口 [分页]

### 接口名称 GET `/store/products`

### 返回字段

| 名称      | 类型      |  说明    |
| ----------| --------- | -------- |
| id | Number | id |
| title | String | 标题 |
| cover | CommmonImage | 第一张商品图 |
| inStockQuantity | Number | 剩余数量 |
| point | Number | 积分 |

### 示例

```json
[
   {
      "id":3,
      "title":"121212",
      "point":1,
      "inStockQuantity":0,
      "cover":{
         "fileType":"png",
         "thumb":"http://i1.cdn.test.17173.com/gdthue/YWxqaGBf/snsapp/20181018/bleHIdbmAdfsbon.png!a-6-240x240.jpg",
         "height":754,
         "width":846,
         "url":"http://i1.cdn.test.17173.com/gdthue/YWxqaGBf/snsapp/20181018/bleHIdbmAdfsbon.png",
         "original":"http://i1.cdn.test.17173.com/gdthue/YWxqaGBf/snsapp/20181018/bleHIdbmAdfsbon.png"
      }
   }
]
```

## <span id="Product">商品详情页接口</span>

### 接口名称 GET `/store/products/{product}`

### 返回字段

| 名称      | 类型      |  说明    |
| ----------| --------- | -------- |
| id | Number | id |
| title | String | 标题 |
| images | CommmonImage[] | 商品图 |
| inStockQuantity | Number | 剩余数量 |
| point | Number | 积分 |
| kindLabel | String | 商品类型 Label (实体商品|虚拟商品) |
| exchangeStatus | ExchangeStatus | `是否可以兑换该商品` 的信息 |

#### ExchangeStatus 实体

| 名称      | 类型      |  说明    |
| ----------| --------- | -------- |
| canExchange | Boolean | 是否可以兑换 |
| message | String | 信息，不能兑换时为不能兑换的理由 |
| type | type | 类型, 见下方类型列表 |

#### 是否可兑换的类型列表

失败类型：

- '未登录用户无法兑换', 'require-login'
- '该商品未上架', 'isnt-list'
- '来晚啦，已兑换完啦', 'require-in-stock-quanitity'
- '积分不足，暂不可兑换', 'require-point'

成功类型：

- '兑换', 'can-exchange'

### 示例

```json
{
   "id":3,
   "title":"121212",
   "point":1,
   "inStockQuantity":0,
   "images":[
      {
         "fileType":"png",
         "thumb":"http://i1.cdn.test.17173.com/gdthue/YWxqaGBf/snsapp/20181018/bleHIdbmAdfsbon.png!a-6-240x240.jpg",
         "height":754,
         "width":846,
         "url":"http://i1.cdn.test.17173.com/gdthue/YWxqaGBf/snsapp/20181018/bleHIdbmAdfsbon.png",
         "original":"http://i1.cdn.test.17173.com/gdthue/YWxqaGBf/snsapp/20181018/bleHIdbmAdfsbon.png"
      },
      {
         "fileType":"png",
         "thumb":"http://i1.cdn.test.17173.com/gdthue/YWxqaGBf/snsapp/20181018/FFakkebmAdfsduf.png!a-6-240x240.jpg",
         "height":1104,
         "width":756,
         "url":"http://i1.cdn.test.17173.com/gdthue/YWxqaGBf/snsapp/20181018/FFakkebmAdfsduf.png",
         "original":"http://i1.cdn.test.17173.com/gdthue/YWxqaGBf/snsapp/20181018/FFakkebmAdfsduf.png"
      }
   ],
   "exchangeStatus": {
       "canExchange": true,
       "message": "兑换",
       "type": "can-exchange"
   },
   "kindLabel": "实体商品"
}
```

## 用户积分历史记录

### 接口名称 GET `store/user/point-history`

### 返回字段

| 名称      | 类型      |  说明    |
| ----------| --------- | -------- |
| title | String | 积分项目名称 |
| point | Number | 积分 |
| direct | String | 积分增减 |
| productTitle | String | 产品名称（兑换时） |
| challengeTitle | String | 挑战标题（入围时） |

### 示例

```json
{
    "status": 0,
    "msg": "ok.",
    "data": {
        "totalNum": 3,
        "pageNo": 1,
        "pageSize": 20,
        "listData": [
            {
                "createTime": 1539913673,
                "title": "兑换商品",
                "point": 10,
                "direct": "-",
                "productTitle": "10积分商品",
                "challengeTitle": ""
            },
            {
                "createTime": 1539771402,
                "title": "积分过期",
                "point": 5,
                "direct": "-",
                "productTitle": "",
                "challengeTitle": ""
            },
            {
                "createTime": 1539770907,
                "title": "帖子入围积分奖励",
                "point": 10,
                "direct": "+",
                "productTitle": "",
                "challengeTitle": "这是一个挑战，却又不是一个挑战"
            }
        ],
        "extras": {
            "point": 5,
            "date": "2018年12月31日"
        }
    }
}
```

## 用户积分兑换历史记录

### 接口名称 GET `store/user/point-exchange-history`

### 返回字段

| 名称      | 类型      |  说明    |
| ----------| --------- | -------- |
| id | Number | 订单ID |
| createTime | Timestamp | 兑换时间 |
| updateTime | Timestamp | 状态更新时间 |
| statusLabel | String | 商品状态 |
| processStatusLabel | String | 订单状态 |
| product | Product | 商品对象 |
| contact | Contact [] | 联系方式实体数组 |
| delivery | Delivery [] | 配送方式实体数组 |

#### Contact 实体

| 名称      | 类型      |  说明    |
| ----------| --------- | -------- |
| label | String | 字段名 |
| value | String | 字段值 |

#### Delivery 实体

| 名称      | 类型      |  说明    |
| ----------| --------- | -------- |
| label | String | 字段名 |
| value | String | 字段值 |
| copyable | Boolean | 该字段是否可复制 |

[product=>Product](#Product)

### 示例

```json
{
    "status": 0,
    "msg": "ok.",
    "data": {
        "totalNum": 1,
        "pageNo": 1,
        "pageSize": 20,
        "listData": [
            {
                "id": 22,
                "createTime": 1539913673,
                "updateTime": 1539914783,
                "statusLabel": "已发货",
                "processStatusLabel": "正常",
                "product": {
                    "id": 1,
                    "title": "10积分商品",
                    "point": 10,
                    "inStockQuantity": 4,
                    "cover": null
                },
                "contact": [
                    {
                        "label": "收货人",
                        "value": "1212"
                    },
                    {
                        "label": "手机号",
                        "value": "15695912900"
                    },
                    {
                        "label": "配送地址",
                        "value": "北京市 北京城区 朝阳区 详细地址"
                    },
                    {
                        "label": "邮政编码",
                        "value": "350001"
                    },
                    {
                        "label": "QQ",
                        "value": "283326102"
                    }
                ],

                "delivery": [
                    {
                        "label": "快递公司",
                        "value": "圆通快递",
                        "copyable": false
                    },
                    {
                        "label": "运单号",
                        "value": "366612334455",
                        "copyable": true
                    },
                ]
            }
        ],
        "extras": null
    }
}
```

## 查看订单详情

### 接口名称 GET `store/orders/{order}`

接口返回结果和 `store/user/point-exchange-history` 定义的实体一致

## 首页积分商城用户信息和商城最新兑换记录

### 接口名称 GET `store/user/point-status`

### 返回字段

| 名称      | 类型      |  说明    |
| ----------| --------- | -------- |
| totalPoint | Number | 总积分 |
| pointExpireNotice | PointExpireNotice | 即将过期的积分提示 |
| latestExchangeStatus | LatestExchangeStatus[] | 商城最新的兑换记录 |

#### PointExpireNotice 实体

| 名称      | 类型      |  说明    |
| ----------| --------- | -------- |
| point | Number | 即将过期的积分 |
| date | String | 下次过期时间的文本显示 |
| visible | Boolean | 是否在前台显示积分过期提示 |

#### LatestExchangeStatus 实体

| 名称      | 类型      |  说明    |
| ----------| --------- | -------- |
| id | Number | id |
| product | Product | 商品 |
| user | User | 用户信息 |
| createTime | Number | 该兑换创建时间 |

#### LatestExchangeStatus > User 实体

| 名称      | 类型      |  说明    |
| ----------| --------- | -------- |
| id | Number | 用户 id |
| nickname | String | 用户昵称 |
| avatar | String | 用户头像地址 |
| sex  | String    | 性别 0=女，1=男 |
| verified  | String  | 用户认证，空为 '' |

[product=>Product](#Product)

### 示例

```json
{
   "totalPoint":0,
   "pointExpireNotice":{
      "point":0,
      "date":"2019年01月01日00时",
      "visible":true
   },
   "latestExchangeStatus":[
      {
         "id":1,
         "product":{
            "id":3,
            "title":"121212",
            "point":1,
            "inStockQuantity":1,
            "cover":{
               "fileType":"png",
               "thumb":"http://i1.cdn.test.17173.com/gdthue/YWxqaGBf/snsapp/20181018/bleHIdbmAdfsbon.png!a-6-240x240.jpg",
               "height":754,
               "width":846,
               "url":"http://i1.cdn.test.17173.com/gdthue/YWxqaGBf/snsapp/20181018/bleHIdbmAdfsbon.png",
               "original":"http://i1.cdn.test.17173.com/gdthue/YWxqaGBf/snsapp/20181018/bleHIdbmAdfsbon.png"
            }
         },
         "user":{
            "id":137395925,
            "nickname":"杨青",
            "avatar":"http://i.17173cdn.com/gdthue/YWxqaGBf/snsapp/20180318/VLtKTMbmiCrqmvq.jpg!a-1-120x120.jpg",
            "sex":"1",
            "verified":""
         },
         "createTime":1539913673
      }
   ]
}
```

## APP 使用的积分商城的 banner 接口

### 接口名称 GET `/store/products/banner`

### 返回字段

Banner 实体列表

#### Banner 实体

| 名称      | 类型      |  说明    |
| ----------| --------- | -------- |
| product | Product | 商品 |
| source | String | 图片地址 |

#### Banner > Product 实体

| 名称      | 类型      |  说明    |
| ----------| --------- | -------- |
| id | Number | id |
| title | String | 标题 |
| point | Number | 积分 |
| productUrl | String | Hybrid 积分商城对应的商品详情页 url |

### 示例

```json
[
   {
      "product":{
         "id":3,
         "title":"121212",
         "point":1,
         "productUrl":"http://dev.local.17173.com/store/products/3"
      },
      "source":"http://i1.cdn.test.17173.com/gdthue/YWxqaGBf/snsapp/20181022/WajbNCbmAnnAotx.png"
   }
]
```

## 获取中国 `省，市，区` 行政区域

### 接口名称 GET `/store/districts`

### 返回字段

District 数组 (树状信息)

#### District 实体

| 名称      | 类型      |  说明    |
| ----------| --------- | -------- |
| id | Number | id |
| name | String | 中文名 |
| children | District [] | 省和市两个级别分别有 children 数组 |

### 示例

```json
[
   {
      "id":2,
      "name":"北京市",
      "children":[
         {
            "id":3,
            "name":"北京城区",
            "children":[
               {
                  "id":4,
                  "name":"东城区"
               },
               {
                  "id":5,
                  "name":"西城区"
               }
            ]
         }
      ]
   }
]
```

## 获取兑换信息的提交表单

### 接口名称 GET `/store/products/{product}/exchange-form`

### 返回字段

返回字段为 Field 数组

#### Field 实体

| 名称      | 类型      |  说明    |
| ----------| --------- | -------- |
| label | String | 表单的显示文本 |
| type | String | 当前表单类型, 目前有 'text', 'address' 两种，分别为文本和地址两种字段 |
| name | String | 表单的 name 值 |
| value | mixed | 默认值，其中 address 的默认值为对象 |
| requried | Boolean | 是否必填 |

#### address 的默认值

| 名称      | 类型      |  说明    |
| ----------| --------- | -------- |
| userName | String | 收货人姓名
| postalCode | String | 邮编 |
| provinceName | String | 省 |
| provinceId | Number | 省 ID |
| cityName | String | 市 |
| cityId | Number | 市 ID |
| areaName | String | 区 |
| areaId | Number | 区 ID |
| detailInfo | String | 详细收货地址信息 |
| telNumber | String | 收货人手机号码 |

### 说明

address 地址类型在前端需要进行扩展，地址选择器可以调用 `/store/districts` 获取行政区域信息
在管理后台，记忆点-> 实体商品兑换地址配置 里头可以定制兑换表单

### 示例

```json
[
   {
      "label":"地址",
      "type":"address",
      "name":"address",
      "required":true,
      "value": {
          "userName":"1212",
          "postalCode":"350001",
          "provinceName":"福建省",
          "provinceId":2,
          "cityName":"福州市",
          "cityId":4,
          "areaName":"鼓楼区",
          "areaId":6,
          "detailInfo":"详细地址",
          "telNumber":"15695912900"
      }
   },
   {
      "label":"QQ",
      "required":true,
      "type":"text",
      "name":"qq",
      "value": "283326102"
   }
]
```

## 兑换商品

### 接口名称 POST `/store/products/{product}/exchange`

### 请求字段

根据 `/store/products/{product}/exchange-form` 以 JSON 的方式提交

其中 key 为 field 的 name 值，具体见示例

地址需要提交 provinceId, cityId, areaId

### 示例

```json
{
   "address": {
       "userName":"1212",
       "postalCode":"350001",
       "provinceId":2,
       "cityId":4,
       "areaId":6,
       "detailInfo":"详细地址",
       "telNumber":15695912900
   },
  "qq": "283326102"
}
```
