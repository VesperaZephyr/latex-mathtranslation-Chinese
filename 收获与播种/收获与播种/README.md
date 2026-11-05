# 收获与播种（Récoltes et Semailles）

*中文翻译稿* — Chinese translation / LaTeX typeset

本目录是 **latex-mathtranslation-Chinese（数学著作中文翻译合集）** 的一个子项目。

---

## 项目简介 / Project Introduction

本目录是 **latex-mathtranslation-Chinese（数学著作中文翻译合集）** 中的一本：格罗滕迪克的数学自传与学术反思长文《收获与播种》（*Récoltes et Semailles*）的中文翻译（LaTeX 排版）。

This directory is part of the **latex-mathtranslation-Chinese (Chinese translations collection)**: a Chinese translation (typeset in LaTeX) of *Récoltes et Semailles* by Alexandre Grothendieck.

- **原书 / Original work**
  - 书名 / Title：收获与播种 / *Récoltes et Semailles*
  - 副题 / Subtitle：*Réflexions et témoignage sur un passé de mathématicien*（一位数学家的过往反思与见证）
  - 作者 / Author：Alexandre Grothendieck（亚历山大·格罗滕迪克）
  - 篇幅 / Length：原书约 929 页（正文 p.23–929）
- **译本 / Translation**
  - 译者 / Translator：数译（mathtranslations.org 翻译 collective）
  - 排版模板 / Template：mathtranslation.cls v3.2
  - 翻译状态 / Status：全书已译完；六册（五卷分册 + 全书合订）各 **0 LaTeX 错误 / 0 缺字 / 0 未定义引用**，目录条目与 PDF 书签一一对应

---

## 内容结构 / Contents

《收获与播种》是格罗滕迪克的数学自传与学术反思长文，原书按「前奏 + 四个部分」组织。本译本据此拆为五卷单独成册，另保留全书合订一册，六册各自可独立编译。

| 卷 / Vol. | 段 / Section | 原书页 / Pages | 章 / Chapters | 主文件 / Master |
|---|---|---|---|---|
| 卷一 | 前奏（主题的呈现） | p.23–122 | 1–4 | `vol-prelude.tex` |
| 卷二 | 第一部（愚妄与更新） | p.123–254 | 5–12 | `vol-part1.tex` |
| 卷三 | 第二部（葬礼 I） | p.255–412 | 13–16 | `vol-part2.tex` |
| 卷四 | 第三部（葬礼 II） | p.413–632 | 17、18.1–18.2 | `vol-part3.tex` |
| 卷五 | 第四部（葬礼 III） | p.633–929 | 18.3–末 | `vol-part4.tex` |
| 全书合订 | 五段连续 | p.23–929 | 1–18 | `main-all.tex` |

正文汉字合计约 **898,300**（33 个在用片段文件，存于 `chapters/`）；封面为**自绘 TikZ 矢量画**——暮色中的麦田与播种者剪影，六册同一母题、只换配色与卷次，无外部图片依赖。

The book is Grothendieck's mathematical autobiography and manifesto. The translation is split into five volumes (prelude + four parts) plus a full compilation, each independently compilable.

---

## 项目特点 / Project Features

- **完整中译**：全书译文已定稿，保留作者第一人称、情感炽烈、讽刺辛辣的文风与作为「标点武器」的反讽引号
- **专业 LaTeX 排版**：数学公式、边码（原打字稿页码 `\origpage{}`）、脚注（含连续注号与 `(*)` 角标）均照原书体例排印
- **五卷 + 合订**：同一份译文拆为六册独立编译，章号与各卷 `\setcounter{chapter}` 已手工校准
- **TikZ 自绘封面**：暮色麦田母题，任意分辨率不失真、无版权问题
- **开源**：所有 LaTeX 源以 **CC BY 4.0 国际许可证**托管

- **Faithful to the source**: the translation follows the original closely while rendering it into Chinese
- **Professional LaTeX typesetting**: crisp mathematical formulas; original-page margin notes and footnotes reproduced per the source conventions
- **Open source**: all LaTeX source is hosted under the CC BY 4.0 International License

---

## 编译方法 / Compilation Instructions

本项目使用 **XeLaTeX** 工具链。每册需多轮编译以稳定目录与书签（封面用 `remember picture, overlay` 定位，至少两遍才准确；建议跑满 4 遍）：

This project uses the **XeLaTeX** toolchain. Each volume needs multiple passes to stabilize the table of contents and bookmarks (recommended: 4 passes):

```bash
# 单册（以卷三为例）/ one volume (e.g. vol. 3)
xelatex vol-part2.tex
xelatex vol-part2.tex
xelatex vol-part2.tex
xelatex vol-part2.tex

# 全书合订 / full compilation
xelatex main-all.tex   # ×4
```

> **注意**：不要在构建脚本里 `export TEXINPUTS=".:"` —— Windows 的 kpathsea 下会让当前目录失效，xelatex 直接报 `I can't find file`。保持默认搜索路径即可。

### 编译环境要求 / Environment Requirements

- TeX Live 2023 或更高版本 / TeX Live 2023 or later
- 已安装 ctex 宏包（中文支持）/ ctex package installed (Chinese support)
- 已安装 amsmath、amssymb、graphicx、hyperref、tikz 等常用数学与文献宏包
- 注意：所有 `.tex` / `.cls` 源文件须以 **UTF-8 无 BOM + CRLF** 行尾保存

---

## 项目结构 / Project Structure

```
收获与播种/
├── main-all.tex            # 全书合订主控
├── vol-prelude.tex         # 卷一 前奏（ch1–4）
├── vol-part1.tex           # 卷二 第一部（ch5–12）
├── vol-part2.tex           # 卷三 第二部（ch13–16）
├── vol-part3.tex           # 卷四 第三部（ch17、18.1–18.2）
├── vol-part4.tex           # 卷五 第四部（18.3–末）
├── common.tex              # 六册共用导言区（样式、宏、页眉页脚）
├── cover-art.tex           # 统一封面（TikZ 自绘）
├── mathtranslation.cls      # 基类 v3.2（不改）
├── chapters/               # 33 个在用片段（part1-/part2-/part3-/part4-*.tex）
├── STYLE.md                # 文风与宏规范
├── TERMINOLOGY.md          # 术语表
├── 翻译进度.md              # 翻译进度
└── 交接文档-收获与播种.md    # 项目交接文档
```

> 说明：上表为源码与项目文档概要；构建产物（`*.pdf`、`*.aux`、`*.log` 等）、OCR/工程文件（PDF 底本、`*.json` 转储、Python 脚本、工作目录 `_archive`/`_mine`/`_render`/`_test_build`/`_work`/`_build_vol` 等）按根目录 `.gitignore` 不随仓库分发。

---

## 贡献指南 / Contributing

我们非常欢迎任何形式的贡献！若在阅读中发现排版错误、印刷错误、内容疏漏或可改进之处，请通过以下方式参与：

We warmly welcome contributions of any kind! If you find typesetting errors, typos, omissions or improvements, please contribute via:

1. 提交 GitHub Issue 详细描述问题 / Submit a GitHub Issue describing the problem
2. Fork 本仓库，修改后提交 Pull Request / Fork and submit a Pull Request
3. 发送邮件至 vesperazephyr2006@gmail.com

---

## 许可证 | License

本作品采用 **CC BY 4.0 国际许可证** 授权，与全合集其他译本一致；许可证全文见仓库顶层 README 的「许可 / License」一节。

This work is licensed under the **CC BY 4.0 International License**, the same as all other translations in this collection; the full license text is in the top-level README ("许可 / License" section).

[![CC BY 4.0](https://licensebuttons.net/l/by/4.0/88x31.png)](https://creativecommons.org/licenses/by/4.0/)

您可以自由地：**分享**（复制、发行本作品）与 **改编**（二次创作），但须遵守：

You are free to **Share** (copy and redistribute) and **Adapt** (remix, transform), subject to:

- **署名 (Attribution)**：给出适当署名，提供许可证链接，并标明是否改动

（本合集统一采用 CC BY 4.0：允许商业使用，不要求相同方式共享。）

(Full collection uses CC BY 4.0 uniformly: commercial use is permitted and ShareAlike is not required.)

> 如果您愿意支持本项目持续制作更多高质量数学教材的重排与中文翻译，请参见仓库顶层 README 的 **「支持作者 / Support the Authors」** 一节：`../README.md#支持作者--support-the-authors`。

---

## 致谢 / Acknowledgments

- 由衷感谢《收获与播种》的原作者 **Alexandre Grothendieck** 留下这部自传与反思长文。
- 感谢 **数译（mathtranslations.org）** 翻译团队完成中译，并感谢所有为本子项目贡献力量与建议的数学爱好者。

- Sincere thanks to **Alexandre Grothendieck** for writing *Récoltes et Semailles*.
- Thanks to the **数译 (mathtranslations.org)** translation collective and all mathematics enthusiasts who contributed to this sub-project.
