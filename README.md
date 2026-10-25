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
| `aluffi-algebra-chapter-0/` | Algebra: Chapter 0 | Paolo Aluffi | 全本翻译完成 |
| `breuil-emerton/` | Breuil–Emerton (CN) | Breuil, Emerton | 翻译完成 |
| `brezis-functional-analysis/` | 泛函分析 | H. Brézis | 翻译完成 |
| `klainerman-lecture-notes-analysis/` | Lecture Notes in Analysis (2011) | Sergiu Klainerman | 翻译完成 |
| `bochner-riesz-means/` | Lectures on Bochner-Riesz Means | K. M. Davis, Y.-C. Chang | 翻译完成 |
| `milne-etale-cohomology/` | Lectures on Étale Cohomology | J. S. Milne | 翻译完成 |
| `bosch-linear-algebra/` | Lineare Algebra | Siegfried Bosch | 翻译完成 |
| `morel-representation-theory/` | MAT 449 Representation Theory | Sophie Morel | 翻译完成 |
| `milne-elliptic-curves/` | Elliptic Curves | J. S. Milne | 翻译完成 |
| `milne-class-field-theory/` | Class Field Theory | J. S. Milne | 翻译完成 |
| `chevalley-profinite-groups/` | Profinite Groups and Galois Cohomology (thesis) | Rosalie Chevalley | 翻译完成 |
| `sga/` | Séminaire de Géométrie Algébrique (SGA) | Grothendieck et al. | 翻译完成 |
| `stacks-and-moduli/` | Stacks and Moduli | — | 翻译完成 |
| `stein-lectures/` | Stein 讲座 | Elias M. Stein | 翻译完成 |
| `cordoba-suprematism-harmonic/` | Suprematism in Harmonic Analysis | Antonio Córdoba | 翻译完成 |
| `tensor-product/` | Tensor Product | — | 翻译完成 |
| `fractal-sets-falconer/` | The Geometry of Fractal Sets | K. J. Falconer | 翻译完成 |
| `classical-harmonic-analysis/` | 古典调和分析 | — | 翻译完成 |
| `minimal-surfaces/` | 极小曲面教程 | — | 翻译完成 |
| `harmonic-analysis-intro-zeno/` | 调和分析入门——为深入理解函数的性质 | 澤野嘉宏 | 翻译完成 |
| `hintz-microlocal-analysis/` | An Introduction to Microlocal Analysis (GTM 304) | Peter Hintz | 翻译完成 |
| `visual-differential-forms/` | A Visual Introduction to Differential Forms and Calculus | — | 翻译完成 |

> 更多译本将逐步加入（如张慧星 ODE、收获与播种、代数/数论/几何导引等按计划后续补充）。/ More translations will be added over time.

## 本地编译 / Building locally

每本书为独立子目录，进入对应目录后按各自的 `main.tex` 编译即可，例如：

```sh
cd <book-directory>
xelatex main.tex
biber  main     # 若使用 biblatex/biber
xelatex main.tex
xelatex main.tex
```

## 支持作者 / Support the Authors

本合集是一个完全免费的开源项目，所有翻译工作均由志愿者利用业余时间完成。我们投入大量精力以确保译文质量与内容准确。

This collection is a completely free open-source project. All translation work is done by volunteers in their spare time. We invest significant effort to ensure translation quality and accuracy.

如果这个合集对你的学习与科研有所帮助，欢迎进行小额捐赠，用于购买正版书籍、维护项目与制作更多高质量数学资料：

If this collection helps your study or research, you may consider a small donation. Donations are used to purchase official books, maintain the project, and produce more high-quality mathematical material:

- 购买更多数学经典教材的正版书籍
- 维护项目（仓库托管、域名等）
- 支持更多开源数学项目

- Purchasing official copies of more classic mathematics textbooks
- Maintaining the project (repository hosting, domains, etc.)
- Supporting more open-source mathematics projects

### 捐赠方式 / Donation Methods

| 微信支付 / WeChat Pay | 支付宝 / Alipay |
|----------------------|-----------------|
| ![WeChat](https://github.com/user-attachments/assets/dee2c09a-b5e6-403d-8977-e7fcb99010f7) | ![Alipay](https://github.com/user-attachments/assets/67ed9d86-049f-497c-b44c-7acaefbf3efe) |

## 许可 / License

具体许可以各书目录内的 `LICENSE*` 文件为准；未声明者默认保留原作者版权，
翻译稿仅供学习交流使用。
