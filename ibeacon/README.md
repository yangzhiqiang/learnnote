##概述

iBeacon技术，是2013年苹果发布的一项技术，基于BLE（bluetooth low energy）广播。蓝牙设备会按照一定的格式进行广播，广播的内容是一个标识，由UUID,Major,Minor三部分组成，
手机端会进行监听，如果进入到某一个区域后，手机端会收到这个标识，手机也就知道了自己是处于什么样的iBeacon区域内。


##详细
* UUID: 由uuidgen命令生成的全球唯一的标识符。uuidgen在Mac，Linux，Windows都有。此部分多用来区分不同的公司的产品和服务的。
* Major: unsigned short，此部分多用来区分不同的大区，使用此Major的全部或者一部分来区分，例如以城市为基础进行区分。
* Minor: unsigned short, 此部分用来区分更小的区域，例如某城市下的，某一个商店，某一个地点等等。
