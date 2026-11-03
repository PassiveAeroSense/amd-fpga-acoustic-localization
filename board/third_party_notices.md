# 版权与素材来源

本仓库项目自有代码及原创文档采用根目录 MIT 许可证。MIT 文本来源：https://opensource.org/license/mit 。第三方材料不因本仓库的许可证而重新授权。

- FPGA 算法核的 C++/RTL 实现由本项目自行编写；HLS 导出工程含 AMD 工具生成的封装、支持文件和版权声明。“未使用商用 IP 核”指未采购商用算法 IP，不表示 Vivado/Vitis 或 FPGA 原语为项目原创。
- `src/third_party_notices.txt` 是原始工程随附的逐文件 AMD/Xilinx 声明，完整保留。请在再分发对应生成文件时一并保留。
- Vivado/Vitis 2024.2、器件库、Smacq 软件、开发板厂家资料均需从其官方渠道获取，仓库不提供软件安装包或工具许可证。
- 论文的 AMD 标识、VM1000 器件产品图及应用场景图保留各自权利人权利和论文内的来源引用。应用场景图来自 Schulinck、Telent、宝安湾、DJI，详见论文参考文献 [10]–[13]；这些材料不在项目 MIT 授权范围内。
- `board/hardware/photos` 中六张现场实物照片为项目提供，原文件名和 SHA-256 见其 manifest.json。电路图为项目文档中的设计材料；可用文件为图片，不包含制造用 CAD 源文件。
- Python 第三方依赖由使用者自行安装，分别遵循各项目许可证。缓存的 joblib 模型仅用于项目内可信实验记录，复核脚本不需要反序列化它。
