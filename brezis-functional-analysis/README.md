# Analyse fonctionnelle (泛函分析)

*中文翻译稿* — Chinese translation / LaTeX typeset

本目录是 **latex-mathtranslation-Chinese（数学著作中文翻译合集）** 的一个子项目。

---

## 项目简介 / Project Introduction

本目录是 **latex-mathtranslation-Chinese（数学著作中文翻译合集）** 中的一本：数学著作《Analyse fonctionnelle (泛函分析)》的中文翻译（LaTeX 排版）。译文在尽力贴合原意的前提下以中文呈现，便于中文读者研读。

This directory is part of the **latex-mathtranslation-Chinese (Chinese translations collection)**: a Chinese translation (typeset in LaTeX) of *Analyse fonctionnelle (泛函分析)*. The translation renders the original into Chinese while striving to stay faithful to its meaning, for the benefit of Chinese readers.

---

## 项目特点 / Project Features

- **中文译稿**：在尽力贴合原意的前提下以中文呈现，便于中文读者研读
- **专业 LaTeX 排版**：数学公式与原文一致，字体清晰锐利
- **优化的阅读体验**：行距与页边距经仔细调整，适合屏幕阅读与打印
- **完整的超链接支持**：目录、引用、定理编号、索引页码均为可点击链接
- **开源**：所有 LaTeX 源以 CC BY-NC-SA 4.0 国际许可证托管，可自由获取与改进

- **Faithful to the source**: the content follows the original and is rendered into Chinese while staying close to its meaning
- **Professional LaTeX typesetting**: crisp and sharp mathematical formulas with modern fonts
- **Optimized reading experience**: carefully adjusted line spacing and margins for screen and print
- **Full hyperlink support**: table of contents, citations, theorem numbers and index page numbers are clickable
- **Open source**: all LaTeX source is hosted under the CC BY-NC-SA 4.0 International License

---

## 编译方法 / Compilation Instructions

本项目使用 XeLaTeX 编译器。建议通过 `latexmk` 自动完成多轮编译：

This project uses the XeLaTeX compiler. We recommend `latexmk` for multiple passes:

```bash
# 基础编译 / basic
xelatex main.tex

# 若使用 biblatex/biber:
xelatex main.tex
biber main
xelatex main.tex
xelatex main.tex

# 一键编译 / one-shot
latexmk -xelatex main.tex
```

### 编译环境要求 / Environment Requirements

- TeX Live 2023 或更高版本 / TeX Live 2023 or later
- 已安装 ctex 宏包（中文支持）/ ctex package installed (Chinese support)
- 已安装 amsmath、amssymb、graphicx 等常用数学与图形宏包

---

## 项目结构 / Project Structure

```
brezis-functional-analysis/
├── AJbook.cls
├── cover.tex
├── coverpage.tex
├── font-setup-open.tex
├── main.tex
├── myarrows.sty
├── mycommand.sty
├── references.bib
├── titles-setup.tex
└── chapters/  (17 个 .tex)
```

> 说明：上表为源码概要；被 `\includegraphics` 实际引用的插图（如 `figs/`、`figures/`）一并纳入，构建产物（`*.pdf`、`*.aux` 等）不随仓库分发。

---

## 贡献指南 / Contributing

我们非常欢迎任何形式的贡献！若在阅读中发现排版错误、印刷错误、内容疏漏或可改进之处，请通过以下方式参与：

We warmly welcome contributions of any kind! If you find typesetting errors, typos, omissions or improvements, please contribute via:

1. 提交 GitHub Issue 详细描述问题 / Submit a GitHub Issue describing the problem
2. Fork 本仓库，修改后提交 Pull Request / Fork and submit a Pull Request
3. 发送邮件至 vesperazephyr2006@gmail.com

---

## 许可证 | License

本作品采用 **CC BY-NC-SA 4.0 国际许可证** 授权。

This work is licensed under the **CC BY-NC-SA 4.0 International License**.

[![CC BY-NC-SA 4.0](https://licensebuttons.net/l/by-nc-sa/4.0/88x31.png)](https://creativecommons.org/licenses/by-nc-sa/4.0/)

您可以自由地：**分享**（复制、发行本作品）与 **改编**（二次创作），但须遵守：

You are free to **Share** (copy and redistribute) and **Adapt** (remix, transform), subject to:

- **署名 (Attribution)**：给出适当署名，提供许可证链接，并标明是否改动
- **非商业性 (NonCommercial)**：不得将本作品用于商业目的
- **相同方式共享 (ShareAlike)**：二次创作须采用相同许可证分发

完整许可证文本见本目录 `LICENSE` 文件。

Full license text: see the `LICENSE` file in this directory.

> 如果您愿意支持本项目持续制作更多高质量数学教材的重排与中文翻译，请参见仓库顶层 README 的 **「支持作者 / Support the Authors」** 一节：`../README.md#支持作者--support-the-authors`。

---

## 致谢 / Acknowledgments

- 由衷感谢《Analyse fonctionnelle (泛函分析)》的原作者 **Haim Brézis** 写下这部著作。
- 感谢所有为本子项目贡献力量与建议的数学爱好者。

- Sincere thanks to **Haim Brézis** for writing *Analyse fonctionnelle (泛函分析)*.
- Thanks to all mathematics enthusiasts who contributed to this sub-project.

