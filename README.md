# TransformTools

### 简单原理
1. 通过读取剪贴板内容做指定规则的文本替换，而后将结果复制到剪贴板
2. 将 Shell 脚本封装成 Mac App，使其可以通过快捷键快速调用

### 使用前
1. 执行 `tools/make-app.sh` 可输出每个模块对应的 Mac App 以及所有模块合计到 `build` 目录
2. 可通过 [Snap](https://itunes.apple.com/cn/app/id418073146?mt=12) 为指定功能 app 设置快捷键，以便快速启动

### 使用
1. Command + C
2. 指定快捷键
3. ···
4. Command + V