# 把 aism 放到 Windows 的 C 盘

这是完整的离线迁移包，约 **269MB**，包含 HyperFrames 工程、角色与分镜素材、音频、字幕和成片。Linux 专用依赖和临时缓存未打包。

## 下载和还原

1. 在本页点击绿色 **Code → Download ZIP**，下载整个分支。
2. 右键下载的 ZIP，选择 **全部解压缩**，打开解压后的文件夹。
3. 双击 **Install-to-C.cmd**。它会合并全部7个分片、校验 SHA-256，再解压到 **C:\aism**。
4. 打开 **C:\aism**，用 Chrome 或 Edge 打开 **观看我的疑惑.html**，即可播放。

也可以直接双击视频：

```text
C:\aism\videos\my-doubts\renders\my-doubts-60s-share.mp4
```

请下载整个 ZIP；单个 `aism.part...` 文件不能独立解压。如果 `C:\aism` 已经存在，脚本会停止，不会覆盖；请先保留原文件夹再继续。本机需要对 C 盘具有写入权限。

## 文件说明

- `Install-to-C.cmd`：在 Windows 上合并、校验并解压；不会自动提权或覆盖已有 `C:\aism`。
- `aism.part001` 至 `aism.part007`：同一个 ZIP 的7个二进制分片。
- `checksums.json`：各分片与完整 ZIP 的 SHA-256 校验值。

迁移包和脚本已经进行静态审阅、分片重组与 ZIP 完整性检查；尚未在你的电脑上执行。仅观看视频无需安装 HyperFrames。继续制作视频的安装步骤见还原后的 `WINDOWS-使用说明.txt`。
