# 数值线性代数及其应用 (Numerical Linear Algebra and Its Applications)

*中文翻译稿* — Chinese translation / LaTeX typeset

本目录是 **latex-mathtranslation-Chinese（数学著作中文翻译合集）** 的一个子项目。

---

## 项目简介 / Project Introduction

本目录是 **latex-mathtranslation-Chinese（数学著作中文翻译合集）** 中的一本：数学著作《数值线性代数及其应用》（*Numerical Linear Algebra and Its Applications*, Second Edition）的中文翻译（LaTeX 排版）。

This directory is part of the **latex-mathtranslation-Chinese (Chinese translations collection)**: a Chinese translation (typeset in LaTeX) of *Numerical Linear Algebra and Its Applications* (Second Edition).

- **原书 / Original work**
  - 书名 / Title：数值线性代数及其应用 / *Numerical Linear Algebra and Its Applications*
  - 版次 / Edition：Second Edition（第二版）
  - 作者 / Authors：Xiao-Qing Jin（金小庆）、Yi-Min Wei（魏益民）、Zhi Zhao（赵志）
  - 出版社 / Publisher：Science Press（科学出版社），2015
- **译本 / Translation**
  - 译者 / Translator：Fingolfin
  - 辅助模型 / Model：DeepSeek-V4.1-Flash
  - 排版模板 / Template：mathtranslation.cls v3.3（数译 mathtranslations.org 排版模板）
  - 翻译日期 / Date：2026 年 11 月

---

## 内容结构 / Contents

全书共 10 章，覆盖数值线性代数的核心算法及其在微分方程中的应用：

| 章 / Ch. | 标题 / Title |
|---|---|
| 1 | 绪论 / Introduction |
| 2 | 高斯消去法 / Gaussian Elimination |
| 3 | 扰动与误差分析 / Perturbation and Error Analysis |
| 4 | 最小二乘问题 / Least Squares Problems |
| 5 | 经典迭代法 / Classical Iterative Methods |
| 6 | Krylov 子空间方法 / Krylov Subspace Methods |
| 7 | 非对称特征值问题 / Nonsymmetric Eigenvalue Problems |
| 8 | 对称特征值问题 / Symmetric Eigenvalue Problems |
| 9 | 在常微分方程与时滞微分方程中的应用 / Applications to ODEs and Delay Differential Equations |
| 10 | 在分数阶扩散方程中的应用 / Applications to Fractional Diffusion Equations |

书末含**符号表（notation）**与**术语索引（terminology index）**，并附 100 条参考文献（编号与源书一致 [1]–[100]）。

The book has 10 chapters covering the core algorithms of numerical linear algebra and their applications to differential equations, followed by a notation table, a terminology index, and a 100-entry bibliography matching the original numbering.

---

## 项目特点 / Project Features

- **中文译稿**：在尽力贴合原意的前提下以中文呈现，便于中文读者研读
- **专业 LaTeX 排版**：数学公式与原文一致，字体清晰锐利
- **半角英文标点体例**：正文统一使用半角（英文）句读标点，符合原书排印习惯
- **完整的超链接支持**：目录、引用、定理编号、索引页码、术语对照均为可点击链接
- **术语索引与符号表**：书末「术语索引」与「符号表」为可跳转的无编号章
- **开源**：所有 LaTeX 源以 CC BY-NC-SA 4.0 国际许可证托管，可自由获取与改进

- **Faithful to the source**: the content follows the original and is rendered into Chinese while staying close to its meaning
- **Professional LaTeX typesetting**: crisp and sharp mathematical formulas with modern fonts
- **Full hyperlink support**: table of contents, citations, theorem numbers and index page numbers are clickable
- **Terminology index & notation**: a clickable terminology index and notation table at the end
- **Open source**: all LaTeX source is hosted under the CC BY-NC-SA 4.0 International License

---

## 编译方法 / Compilation Instructions

本项目使用 XeLaTeX + biblatex/biber 工具链。推荐直接调用仓库自带构建脚本完成多轮编译：

This project uses the XeLaTeX + biblatex/biber toolchain. We recommend the bundled build script for the full multi-pass build:

```bash
# 一键完整构建（xelatex×2 → biber → xelatex×2）/ one-shot full build
bash tools/build.sh full
```

如手动编译，等效步骤为 / Equivalent manual steps:

```bash
xelatex main.tex
xelatex main.tex
biber main
xelatex main.tex
xelatex main.tex
```

### 编译环境要求 / Environment Requirements

- TeX Live 2023 或更高版本 / TeX Live 2023 or later
- 已安装 ctex 宏包（中文支持）/ ctex package installed (Chinese support)
- 已安装 amsmath、amssymb、graphicx、biblatex、biber 等常用数学与文献宏包
- 注意：所有 `.tex` / `.cls` 源文件须以 **UTF-8 无 BOM + CRLF** 行尾保存

---

## 项目结构 / Project Structure

```
Numerical Linear Algebra and Its Applications (Second Edition)/
├── main.tex                 # 主文档（封面、前置、正文 10 章、参考文献、符号表、术语索引）
├── mathtranslation.cls      # 数译排版模板 v3.3
├── mycommand.sty           # 本项目专用宏（不改动 cls）
├── references.bib          # 参考文献（100 条，编号与源书一致）
├── references_bibertool.bib
├── front/                  # 前置材料
│   ├── translator-note.tex # 译者说明
│   ├── series-preface.tex  # 原书丛书序（Shi Zhongci, 2005.7）
│   └── preface.tex         # 作者前言
├── chapters/               # 正文 10 章（ch01–ch10）
├── back/
│   └── notation.tex        # 符号表（后置材料）
├── glossary/               # 术语对照表源
├── source/                 # 扫描底本与抽取记录（不随仓库分发）
├── tools/                  # 构建与辅助脚本（不随仓库分发）
└── figures/               # 矢量插图（如有）
```

> 说明：上表为源码概要；构建产物（`*.pdf`、`*.aux`、`*.log` 等）、OCR/工程文件（`source/`、`tools/`、图片、`*.json`）按根目录 `.gitignore` 不随仓库分发。

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

- 由衷感谢《数值线性代数及其应用》的原作者 **Xiao-Qing Jin、Yi-Min Wei、Zhi Zhao** 写下这部著作。
- 感谢所有为本子项目贡献力量与建议的数学爱好者。

- Sincere thanks to **Xiao-Qing Jin, Yi-Min Wei, and Zhi Zhao** for writing *Numerical Linear Algebra and Its Applications*.
- Thanks to all mathematics enthusiasts who contributed to this sub-project.
