# LaTeX 中文翻译合集 / Chinese Translations of Mathematical Texts

本仓库集中存放**数学著作的中文翻译**（LaTeX 排版），与重排仓库
[`latex-remake`](https://github.com/VesperaZephyr/latex-remake) 分离管理：
重排仓库只放「忠于原版版式的 LaTeX 重排源码」，本仓库只放「中文翻译稿」。

This repository collects **Chinese translations** (typeset in LaTeX) of mathematical
works. It is kept separate from the retypeset repository
[`latex-remake`](https://github.com/VesperaZephyr/latex-remake):
that one holds faithful LaTeX retypesets of original texts, while this one holds
Chinese translation manuscripts.

## 收录说明 / What is included

- 仅纳入**可独立编译的必要源码**：`*.tex`、`*.bib`、`*.cls`、`*.sty`、`*.fd`、
  `*.def`、`*.bst`、`*.ist`、`README*`、`LICENSE*`。
- **排除工程 / OCR 文件**（见 `.gitignore`）：`*.png`/`*.jpg`（扫描页）、`*.py`、
  `*.json`（OCR 转储）、`*.txt`、`tools/`、`_ocr_compare/`、`.workbuddy/`、
  以及所有构建产物（`*.aux`/`*.log`/`*.pdf` 等）。
- 若某译本确需非 TeX Live 自带的矢量图（`*.pdf`/`*.svg`）或字体文件，单独白名单放行。

## 书籍目录 / Books

| 目录 / Directory | 书名 / Title | 原作者 / Authors | 翻译状态 / Status |
|---|---|---|---|
| _（待逐项加入）_ | | | |

> 更多译本将逐步加入。/ More translations will be added over time.

## 本地编译 / Building locally

每本书为独立子目录，进入对应目录后按各自的 `main.tex` 编译即可，例如：

```sh
cd <book-directory>
xelatex main.tex
biber  main     # 若使用 biblatex/biber
xelatex main.tex
xelatex main.tex
```

## 许可 / License

具体许可以各书目录内的 `LICENSE*` 文件为准；未声明者默认保留原作者版权，
翻译稿仅供学习交流使用。
