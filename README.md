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
  `*.def`、`*.bst`、`*.ist`、`README*`。
- **排除工程 / OCR 文件**（见 `.gitignore`）：`*.png`/`*.jpg`（扫描页）、`*.py`、
  `*.json`（OCR 转储）、`*.txt`、`tools/`、`_ocr_compare/`、`.workbuddy/`、
  以及所有构建产物（`*.aux`/`*.log`/`*.pdf` 等）。
- 若某译本确需非 TeX Live 自带的矢量图（`*.pdf`/`*.svg`）或字体文件，单独白名单放行。
- **许可证统一在顶层声明**：各书目录内不再单独附带 `LICENSE` 文件（见文末「许可 / License」）。

## 书籍目录 / Books

| 目录 / Directory | 书名 / Title | 原作者 / Authors | 翻译状态 / Status |
|---|---|---|---|
| `Algebra Chapter 0/` | Algebra: Chapter 0 | Paolo Aluffi | 全本翻译完成 |
| `(GTM 304) An Introduction to Microlocal Analysis (Peter Hintz)/` | An Introduction to Microlocal Analysis (GTM 304) | Peter Hintz | 翻译完成 |
| `A Visual Introduction to Differential Forms and Calculation/` | A Visual Introduction to Differential Forms and Calculus | — | 翻译完成 |
| `Breuil-Emerton-CN/` | Breuil–Emerton (CN) | Breuil, Emerton | 翻译完成 |
| `Brezis泛函分析/` | 泛函分析 (Analyse fonctionnelle) | H. Brézis | 翻译完成 |
| `Hodge Theory and Complex Algebraic Geometry I (Claire Voisin)/` | Hodge Theory and Complex Algebraic Geometry I | Claire Voisin | 翻译完成 |
| `LECTURE NOTES IN ANALYSIS (2011) Sergiu Klainerman/` | Lecture Notes in Analysis (2011) | Sergiu Klainerman | 翻译完成 |
| `Lectures on Bochner-Riesz Means (Katherine Michelle Davis, Yang-Chun Chang)/` | Lectures on Bochner-Riesz Means | K. M. Davis, Y.-C. Chang | 翻译完成 |
| `Lectures on etale cohomology(J.S. Milne)/` | Lectures on Étale Cohomology | J. S. Milne | 翻译完成 |
| `Lieare_Algebra(Siegfried_Bosch)/` | Lineare Algebra | Siegfried Bosch | 翻译完成 |
| `MAT 449-Representation Theory(Sophie Morel)/` | MAT 449 Representation Theory | Sophie Morel | 翻译完成 |
| `Milne椭圆曲线/` | Elliptic Curves | J. S. Milne | 翻译完成 |
| `Milne类域论/` | Class Field Theory | J. S. Milne | 翻译完成 |
| `Numerical Linear Algebra and Its Applications (Second Edition)/` | Numerical Linear Algebra and Its Applications (2nd ed.) | Xiao-Qing Jin, Yi-Min Wei, Zhi Zhao | 翻译完成 |
| `Profinite Groups and Galois Cohomology [thesis] (Rosalie Chevalley)/` | Profinite Groups and Galois Cohomology (thesis) | Rosalie Chevalley | 翻译完成 |
| `SGA/` | Séminaire de Géométrie Algébrique (SGA) | Grothendieck et al. | 翻译完成 |
| `Stacks and Moduli/` | Stacks and Moduli | — | 翻译完成 |
| `Stein讲座/` | Stein 讲座 | Elias M. Stein | 翻译完成 |
| `Suprematism in Harmonic Analysis (Antonio Córdoba)/` | Suprematism in Harmonic Analysis | Antonio Córdoba | 翻译完成 |
| `Teonsor Product/` | Tensor Product | — | 翻译完成 |
| `The Geometry of Fractal Sets (K. J. Falconer)/` | The Geometry of Fractal Sets | K. J. Falconer | 翻译完成 |
| `dat-lectures/` | Dat 七册讲义中文译本 | Jean-François Dat | 翻译完成 |
| `代数, 数论与几何导引(法语)/` | 代数、数论与几何导引 (法语) | — | 翻译完成 |
| `古典调和分析/` | 古典调和分析 | — | 翻译完成 |
| `张慧星Ordinary Differential Equations/` | Ordinary Differential Equations | 张慧星 | 翻译完成 |
| `收获与播种/` | 收获与播种 | — | 翻译完成 |
| `极小曲面教程/` | 极小曲面教程 | — | 翻译完成 |
| `调和分析入门——为深入理解函数的性质(泽野嘉宏)/` | 调和分析入门——为深入理解函数的性质 | 澤野嘉宏 | 翻译完成 |

> 全部译本均可独立编译；各书目录内附有各自的 `README`（含作者、目录、编译方法与项目结构）。

## 本地编译 / Building locally

每本书为独立子目录，进入对应目录后按各自的 `main.tex` 编译即可，例如：

```sh
cd <book-directory>
xelatex main.tex
biber  main     # 若使用 biblatex/biber
xelatex main.tex
xelatex main.tex
```

多数译本也提供一键构建脚本（如 `bash tools/build.sh full`）；具体以各书 `README` 为准。

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

本合集（含全部中文翻译子项目）统一采用 **Creative Commons Attribution 4.0 International (CC BY 4.0)** 许可证。

This collection (including all Chinese-translation sub-projects) is uniformly licensed under the **Creative Commons Attribution 4.0 International (CC BY 4.0)** License.

[![CC BY 4.0](https://licensebuttons.net/l/by/4.0/88x31.png)](https://creativecommons.org/licenses/by/4.0/)

- 您可以自由地：**分享**（复制、发行、通过信息网络传播本作品）与 **改编**（二次创作、翻译、重排），包括商业用途。
- 唯需遵守：**署名 (Attribution)**——以合理方式标明原作者与译者，提供许可证链接，并说明是否对作品进行了修改。
- 不要求相同方式共享（无需 ShareAlike），亦无商业使用限制。
- 各书目录内不再单独附带 `LICENSE` 文件；翻译稿版权归原作者与译者所有，转载与二次创作请遵守上述署名要求。

- You are free to **Share** and **Adapt**, including commercially.
- Only requirement: **Attribution** — give appropriate credit to the original authors and translators, provide a link to the license, and indicate if changes were made.
- No ShareAlike or NonCommercial restriction applies.
- Individual book directories no longer carry a separate `LICENSE` file; copyright of the translations remains with the original authors and translators.
