# Jean-François Dat 数学讲义（七册）中文译本

*中文翻译稿* — Chinese translation / LaTeX typeset

本目录是 **latex-mathtranslation-Chinese（数学著作中文翻译合集）** 的一个子项目，收录
**Jean-François Dat** 在巴黎第六大学（UPMC / Sorbonne Université）多年讲授的七门课程
讲义的中文译本（LaTeX 排版）。译文以原讲义 PDF 为数学内容权威，OCR 文字仅用于辅助
核对；原文中疑似有误之处按原样保留，必要时以译注说明。

This directory is part of the **latex-mathtranslation-Chinese** collection. It contains
Chinese translations (typeset in LaTeX) of seven sets of lecture notes by
**Jean-François Dat**, taught over several years at UPMC / Sorbonne Université.

---

## 来源与版本说明 / Source & Version Note

这些讲义的原始介绍见 Dat 的教学页面：

<https://webusers.imj-prg.fr/~jean-francois.dat/enseignement/enseignement.php>

> **关于《代数与 Galois 理论》的版本**：本译本所依据的是该讲义**较早（最早）的版本**，
> 并非官网上当前列出的最新版本。Dat 教学页面上该讲义的**最新版本为 2017 年版**，
> 本译稿与该版可能存在章节结构与内容差异，请读者留意。
>
> **On the version of *Algèbre et théorie de Galois***: this translation is based on an
> **early (the earliest) version** of the notes, *not* the latest one listed on Dat's
> page. The page's **latest version is the 2017 edition**; the present translation may
> differ from it in structure and content.

---

## 七册目录 / The Seven Volumes

| 目录 / Directory | 课程 / Course | 讲次年分 | 法文原名 |
|---|---|---:|---|
| `07-finite-groups/` | 有限群及其表示 | 2009–2010 | *Groupes finis et leurs représentations* |
| `01-galois/` | 代数与 Galois 理论 | 2015–2016（较早版本） | *Algèbre et théorie de Galois* |
| `05-number-theory/` | 数论 | 2012–2013 | *Théorie des nombres* |
| `04-lie/` | Lie 群与 Lie 代数 | 2012–2013 | *Groupes et algèbres de Lie* |
| `03-semisimple-lie/` | 半单 Lie 代数及其表示 | 2013–2014 | *Algèbres de Lie semi-simples et leurs représentations* |
| `06-algebraic-geometry/` | 代数几何（二） | 2009–2010 | *Géométrie algébrique 2* |
| `02-modular/` | 模形式及其算术性质 | 2014–2015 | *Formes modulaires et leurs propriétés arithmétiques* |

> 上表按「有限群 → Galois → 数论 → Lie 群与 Lie 代数 → 半单 Lie 代数 → 代数几何 → 模形式」
> 的阅读次序排列；目录名前的数字为工程内编号，不表示阅读顺序。

---

## 编译方法 / Compilation Instructions

每册为**独立自包含**的 LaTeX 工程（各自带 `mathtranslation.cls`、`translation-style.tex`
与 `references.bib`）。进入任一册目录后用 XeLaTeX 编译：

```bash
cd 01-galois            # 任选一册
xelatex main.tex
biber  main             # 若使用 biblatex/biber
xelatex main.tex
xelatex main.tex
```

或一键：`latexmk -xelatex main.tex`。

环境要求：TeX Live 2023 或更新；已安装 ctex（中文支持）、amsmath、amssymb、tikz 等常用宏包。

---

## 目录结构 / Project Structure

```text
dat-lectures/
├── README.md
├── LICENSE
├── 01-galois/            main.tex  translation-style.tex  mathtranslation.cls  references.bib  chapters/
├── 02-modular/           同上
├── 03-semisimple-lie/    同上
├── 04-lie/               同上
├── 05-number-theory/     同上
├── 06-algebraic-geometry/同上
└── 07-finite-groups/     同上
```

> 仅收录可独立编译的必要源码（`*.tex` / `*.bib` / `*.cls`）。构建产物（`*.aux`、`*.log`、
> `*.toc`、`*.pdf` 等）、OCR 转储与审校笔记不随仓库分发。

---

## 贡献指南 / Contributing

欢迎提交 Issue 或 Pull Request 指出排版错误、内容疏漏或可改进之处，也可发送邮件至
<vesperazephyr2006@gmail.com>。

---

## 许可证 | License

本作品采用 **CC BY-NC-SA 4.0 国际许可证** 授权。你可自由分享与改编，但须署名、非商业
使用、并以相同方式共享。完整文本见本目录 `LICENSE` 文件。

This work is licensed under the **CC BY-NC-SA 4.0 International License**. Full text:
see the `LICENSE` file in this directory.

---

## 致谢 / Acknowledgments

- 衷心感谢 **Jean-François Dat** 撰写并公开这些讲义。
- 感谢所有为本子项目提供建议与勘误的数学爱好者。

- Sincere thanks to **Jean-François Dat** for writing and sharing these lecture notes.
