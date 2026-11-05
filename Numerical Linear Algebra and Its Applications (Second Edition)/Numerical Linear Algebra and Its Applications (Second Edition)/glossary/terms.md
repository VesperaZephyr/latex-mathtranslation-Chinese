# 术语表（全量种子，翻译中持续扩充）

> 来源优先级（按技能）：① 用户明确要求；② 用户项目约定（`confirmed-terminology.md` 快照，2026-10-20）；
> ③ 学界通行中文定名（香蕉空间/计算数学教材）；④ 本工程局部定义。
> 符号、大小写、专名译法保持一致；一词多义按数学义项区分。
> 标记：`[快照]` = 用户快照已定名；`[通行]` = 学界通行（本工程新采纳，待固化）。
> **页码列 = 待定**（译到对应章节后用 `\newterm{}` 自动回填，再同步到此表）。

---

## 一、§1.1 基本符号（忠实源书 Basic symbols，页码待定）

| 符号 | 含义 | 页码 |
|------|------|------|
| $\mathbb{R}$ | 实数集 | 待定 |
| $\mathbb{C}$ | 复数集 | 待定 |
| $\mathbf{i}\equiv\sqrt{-1}$ | 虚数单位 | 待定 |
| $\mathbb{R}^n$ / $\mathbb{C}^n$ | 实/复 $n$ 维向量空间（向量默认列向量） | 待定 |
| $\mathbb{R}^{m\times n}$ / $\mathbb{C}^{m\times n}$ | 实/复 $m\times n$ 矩阵线性空间 | 待定 |
| 大写字母 $A,B,C,\Delta,\Lambda$ 等 | 矩阵 | 待定 |
| 粗体小写 $\mathbf{x},\mathbf{y},\mathbf{z}$ 等 | 向量 | 待定 |
| 小写 $\alpha,\beta,\lambda$ 等 | 标量 | 待定 |
| $a_{ij}$ | 矩阵 $A$ 的第 $ij$ 个元素 | 待定 |
| $A^T$ | 转置 | 待定 |
| $A^*$ | 共轭转置（Hermitian 转置） | 待定 |
| $\operatorname{span}\{\mathbf{a}_1,\dots,\mathbf{a}_m\}$ | 张成（线性组合构成的线性空间） | 待定 |
| $\operatorname{rank}(A)$ | 矩阵的秩 | 待定 |
| $\dim(S)$ | 向量空间 $S$ 的维数 | 待定 |
| $\det(A)$ | 行列式 | 待定 |
| $\operatorname{diag}(a_{11},\dots,a_{nn})$ | $n\times n$ 对角矩阵 | 待定 |
| $\|A\|$（逐元素） | 元素绝对值矩阵 $(|A|)_{ij}=|a_{ij}|$ | 待定 |
| $I$ | 单位矩阵 | 待定 |
| $e_i$ | 第 $i$ 个单位向量（$I$ 的第 $i$ 列） | 待定 |
| $0$ | 零矩阵或零向量（依语境取适当大小） | 待定 |
| $\|\cdot\|$ | 矩阵或向量的范数 | 待定 |
| $\|\cdot\|_1,\ \|\cdot\|_2,\ \|\cdot\|_\infty$ | $p=1,2,\infty$ 的 $p$ 范数 | 待定 |
| $A(i,j),\ A(i,:),\ A(:,j)$ | （类 MATLAB 记号）第 $(i,j)$ 元、第 $i$ 行、第 $j$ 列 | 待定 |
| $A(i_1:i_2,k),\ A(k,j_1:j_2),\ A(k:l,p:q)$ | 子向量 / 子行 / 子矩阵 | 待定 |

---

## 二、核心术语（按主题，页码待定）

### 2.1 直接法与矩阵分解

| 英文原词 | 中文用词 | 范围/义项 | 页码 |
|----------|----------|-----------|------|
| Gaussian elimination | 高斯消去法 | Ch.2 | 待定 |
| LU factorization / decomposition | LU 分解 | Ch.2 | 待定 |
| partial pivoting | 部分主元法 | Ch.2 | 待定 |
| complete pivoting | 完全主元法 | Ch.2 | 待定 |
| growth factor | 增长因子 | Ch.2 | 待定 |
| Cholesky factorization | Cholesky 分解 | [通行] | 待定 |
| QR factorization | QR 分解 | [通行] | 待定 |
| Gram–Schmidt (process) | 格拉姆–施密特（过程） | [通行] | 待定 |
| Householder transformation / reflection | 豪斯霍尔德变换 / 反射 | [通行] | 待定 |
| Givens rotation | 吉文斯旋转 | [通行] | 待定 |
| singular value decomposition (SVD) | 奇异值分解 | [通行]（快照未收录） | 待定 |
| Schur decomposition | Schur 分解 | [通行] | 待定 |
| Jordan decomposition | Jordan 分解 | Ch.1.4 | 待定 |
| Hessenberg form / reduction | Hessenberg 形 / 化 Hessenberg 形 | [通行] | 待定 |
| rank-revealing QR | 显秩 QR（分解） | [快照未收录] | 待定 |
| matrix factorization (decomposition) | 矩阵分解（分解） | Ch.1.4 | 待定 |
| Cramer's rule | 克拉默法则 | Ch.1.3 | 待定 |
| numerical rank | 数值秩 | [通行] | 待定 |

### 2.2 最小二乘

| 英文原词 | 中文用词 | 范围/义项 | 页码 |
|----------|----------|-----------|------|
| least squares (problem) | 最小二乘（问题） | Ch.4 | 待定 |
| linear / ordinary least squares | 线性 / 普通最小二乘 | Ch.4 | 待定 |
| total least squares (TLS) | 总体最小二乘 | [通行] | 待定 |
| weighted least squares | 加权最小二乘 | [通行] | 待定 |
| normal equations | 正规方程 | Ch.4 | 待定 |
| residual | 残差 | Ch.4 | 待定 |
| Moore–Penrose inverse (pseudoinverse) | Moore–Penrose 逆（伪逆） | [快照未收录] | 待定 |
| generalized inverse | 广义逆 | [通行] | 待定 |
| matrix equation | 矩阵方程 | [通行] | 待定 |
| Lyapunov / Sylvester equation | Lyapunov / Sylvester 方程 | [通行] | 待定 |

### 2.3 误差分析与扰动

| 英文原词 | 中文用词 | 范围/义项 | 页码 |
|----------|----------|-----------|------|
| perturbation | 扰动 | Ch.3 | 待定 |
| perturbation theory | 扰动理论 | Ch.3 | 待定 |
| error analysis | 误差分析 | Ch.3 | 待定 |
| forward error | 前向误差 | Ch.3 | 待定 |
| backward error | 后向误差 | Ch.3 | 待定 |
| rounding error | 舍入误差 | Ch.3 | 待定 |
| floating-point arithmetic | 浮点运算 | Ch.3 | 待定 |
| condition number | 条件数 | Ch.3 | 待定 |
| effective condition number | 有效条件数 | [快照未收录] | 待定 |
| componentwise condition number | 分量条件数 | [通行] | 待定 |
| mixed condition number | 混合型条件数 | [通行] | 待定 |
| Wilkinson's theorem | 威尔金森定理 | [通行] | 待定 |
| ill-conditioned | 病态的 | Ch.3 | 待定 |
| well-conditioned | 良态的 | Ch.3 | 待定 |

### 2.4 经典迭代法

| 英文原词 | 中文用词 | 范围/义项 | 页码 |
|----------|----------|-----------|------|
| iterative method | 迭代法 | Ch.5 | 待定 |
| Jacobi (method) | 雅可比（法） | Ch.5 | 待定 |
| Gauss–Seidel (method) | 高斯–赛德尔（法） | Ch.5 | 待定 |
| successive over-relaxation (SOR) | 逐次超松弛法 | Ch.5 | 待定 |
| symmetric SOR (SSOR) | 对称逐次超松弛法 | Ch.5 | 待定 |
| Richardson iteration | 理查森迭代 | [通行] | 待定 |
| matrix splitting | 矩阵分裂 | Ch.5 | 待定 |
| spectral radius | 谱半径 | [快照未收录] | 待定 |
| convergent / convergence | 收敛的 / 收敛 | Ch.5 | 待定 |
| contraction | 压缩（映射） | [通行] | 待定 |
| diagonal dominant (diagonally dominant) | 对角占优（的） | Ch.5 | 待定 |
| block iteration | 块迭代 | [通行] | 待定 |

### 2.5 Krylov 子空间方法

| 英文原词 | 中文用词 | 范围/义项 | 页码 |
|----------|----------|-----------|------|
| Krylov subspace | Krylov 子空间 | Ch.6 | 待定 |
| Krylov subspace method | Krylov 子空间方法 | Ch.6 | 待定 |
| conjugate gradient (CG) (method) | 共轭梯度法 | Ch.6 | 待定 |
| preconditioned CG (PCG) | 预处理共轭梯度法 | Ch.6 | 待定 |
| MINRES | 最小残量法 | [通行] | 待定 |
| GMRES | 广义极小残量 (GMRES) 法 | Ch.6 | 待定 |
| restarted GMRES | 重启 GMRES | Ch.6 | 待定 |
| BiCG / BiCGSTAB / CGS / QMR | 双共轭梯度 / 稳定双共轭梯度 / CGS / 拟最小残差 | Ch.6 | 待定 |
| Arnoldi process | Arnoldi 过程 | Ch.6 | 待定 |
| Lanczos process | Lanczos 过程 | Ch.6 | 待定 |
| steepest descent (method) | 最速下降法 | [通行] | 待定 |

### 2.6 预处理

| 英文原词 | 中文用词 | 范围/义项 | 页码 |
|----------|----------|-----------|------|
| preconditioner | 预条件子（预处理矩阵） | Ch.5/6/9/10 | 待定 |
| left / right preconditioning | 左 / 右预处理 | [通行] | 待定 |
| incomplete LU (ILU) | 不完全 LU（分解） | [通行] | 待定 |
| diagonal preconditioning | 对角预处理 | [通行] | 待定 |
| circulant preconditioner | 循环预条件子 | [快照未收录] | 待定 |
| Toeplitz solver / iterative Toeplitz solver | Toeplitz 求解器 / 迭代 Toeplitz 求解器 | [快照未收录] | 待定 |
| HSS (Hermitian/skew-Hermitian splitting) | 厄米/反厄米分裂法 | [快照未收录] | 待定 |
| Strang-type preconditioner | Strang 型预条件子 | [快照未收录] | 待定 |
| optimal / superoptimal preconditioner | 最优 / 超最优预条件子 | [快照未收录] | 待定 |
| multigrid (method) | 多重网格法 | [通行] | 待定 |

### 2.7 特征值问题

| 英文原词 | 中文用词 | 范围/义项 | 页码 |
|----------|----------|-----------|------|
| eigenvalue | 特征值 | Ch.7/8 | 待定 |
| eigenvector | 特征向量 | Ch.7/8 | 待定 |
| eigenvalue problem | 特征值问题 | Ch.7/8 | 待定 |
| symmetric eigenvalue problem | 对称特征值问题 | Ch.8 | 待定 |
| nonsymmetric eigenvalue problem | 非对称特征值问题 | Ch.7 | 待定 |
| generalized eigenvalue problem | 广义特征值问题 | [通行] | 待定 |
| nonlinear eigenvalue problem | 非线性特征值问题 | [快照未收录] | 待定 |
| inverse eigenvalue problem | 逆特征值问题 | [快照未收录] | 待定 |
| singular value problem | 奇异值问题 | [快照未收录] | 待定 |
| inverse singular value problem | 逆奇异值问题 | [快照未收录] | 待定 |
| power method | 幂法 | [通行] | 待定 |
| inverse iteration | 反迭代 | [通行] | 待定 |
| Rayleigh quotient | Rayleigh 商 | [通行] | 待定 |
| QR algorithm | QR 算法 | [通行] | 待定 |
| shift (technique) | 位移（技术） | [通行] | 待定 |
| deflation | 收缩（ deflation） | [通行] | 待定 |
| Jacobi method (eigenvalues) | 雅可比法（求特征值） | Ch.8 | 待定 |
| bisection (method) | 对分法 | [通行] | 待定 |
| divide-and-conquer | 分治（算法） | [通行] | 待定 |
| subspace iteration | 子空间迭代 | [通行] | 待定 |
| Rayleigh–Ritz | Rayleigh–Ritz（方法） | [通行] | 待定 |
| characteristic polynomial | 特征多项式 | [通行] | 待定 |

### 2.8 范数与特殊矩阵

| 英文原词 | 中文用词 | 范围/义项 | 页码 |
|----------|----------|-----------|------|
| norm | 范数 | Ch.3.1.1 / §1.1 | 待定 |
| vector norm | 向量范数 | Ch.3.1.1 | 待定 |
| matrix norm | 矩阵范数 | Ch.3.1.1 | 待定 |
| $p$-norm | $p$ 范数 | §1.1 | 待定 |
| Euclidean / 2-norm | 2-范数（Euclid 范数） | §1.1 | 待定 |
| Frobenius norm | Frobenius 范数 | [通行] | 待定 |
| spectral norm | 谱范数 | [通行] | 待定 |
| unitarily invariant norm | 酉不变范数 | [通行] | 待定 |
| Toeplitz matrix | Toeplitz 矩阵（托普利兹矩阵） | [快照未收录] | 待定 |
| circulant matrix | 循环矩阵 | [快照未收录] | 待定 |
| diagonal / tridiagonal matrix | 对角 / 三对角矩阵 | §1.1 | 待定 |
| banded / sparse / dense matrix | 带状 / 稀疏 / 稠密矩阵 | [通行] | 待定 |
| positive definite (matrix) | 正定（矩阵） | [通行] | 待定 |
| Hermitian (matrix) | 厄米（矩阵） | [快照未收录] | 待定 |
| unitary (matrix) | 酉（矩阵） | [快照未收录] | 待定 |
| orthogonal (matrix) | 正交（矩阵） | [快照] | 待定 |
| normal matrix | 正规矩阵 | [通行] | 待定 |
| spectrum | 谱 | [快照未收录] | 待定 |

### 2.9 应用（微分方程）

| 英文原词 | 中文用词 | 范围/义项 | 页码 |
|----------|----------|-----------|------|
| ODE (ordinary differential equation) | 常微分方程 | Ch.9 | 待定 |
| DDE (delay differential equation) | 时滞微分方程 | Ch.9 | 待定 |
| neutral DDE | 中立型时滞微分方程 | Ch.9 | 待定 |
| FDE (fractional differential equation) | 分数阶微分方程 | Ch.10 | 待定 |
| fractional diffusion equation | 分数阶扩散方程 | Ch.10 | 待定 |
| Crank–Nicolson (scheme) | Crank–Nicolson（格式） | [通行] | 待定 |
| WSGD (weighted and shifted Grünwald difference) | 加权移位 Grünwald 差分 | Ch.10 | 待定 |
| Grünwald (difference) | Grünwald（差分） | Ch.10 | 待定 |
| pagerank | 网页排名（PageRank） | [通行] | 待定 |
| boundary value method (BVM) | 边值法 | [快照未收录] | 待定 |
| LMF-based ODE code | 基于线性多步法的常微分方程解法 | [快照未收录] | 待定 |

---

## 三、全书核心术语（快照相，已部分覆盖，保留对照）

| 英文原词 | 中文用词 | 范围/义项 | 证据 |
|----------|----------|-----------|------|
| numerical linear algebra (NLA) | 数值线性代数 | 学科名 | [通行] |
| matrix computation | 矩阵计算 | NLA 别称 | [通行] |
| vector | 向量 | 线性代数 | [快照] |
| matrix | 矩阵 | 线性代数 | [快照] |
| entry (of a matrix) | 元素 | 矩阵的第 ij 个元素 | [通行] |
| transpose | 转置 | $A^T$ | [通行] |
| conjugate transpose | 共轭转置 | $A^*$ | [通行] |
| rank | 秩 | $\operatorname{rank}(A)$ | [快照] |
| dimension (of a space) | 维数 | $\dim(S)$ | [通行] |
| determinant | 行列式 | $\det(A)$ | [快照] |
| diagonal matrix | 对角矩阵 | $\operatorname{diag}(\dots)$ | [通行] |
| identity matrix | 单位矩阵 | $I$ | [通行] |
| zero matrix / zero vector | 零矩阵 / 零向量 | $0$ | [通行] |
| norm | 范数 | $\|\cdot\|$ | [快照] |
| Euclidean norm | 2-范数 / Euclid 范数 | $\|\cdot\|_2$ | [通行] |
| span | 张成（的线性空间） | $\operatorname{span}\{\dots\}$ | [通行] |
| linear system | 线性方程组 / 线性系统 | $A\mathbf{x}=\mathbf{b}$ | [通行] |
| least squares (problem) | 最小二乘（问题） | Ch.4 | [通行] |
| eigenvalue | 特征值 | Ch.7/8 | [快照] |
| eigenvector | 特征向量 | Ch.7/8 | [快照] |
| eigenvalue problem | 特征值问题 | Ch.7/8 | [通行] |
| singular value | 奇异值 | [通行]（快照未收录） | 待定 |
| Gaussian elimination | 高斯消去法 | Ch.2 | [通行] |
| LU factorization / decomposition | LU 分解 | Ch.2 | [通行] |
| perturbation | 扰动 | Ch.3 | [通行] |
| error analysis | 误差分析 | Ch.3 | [通行] |
| condition number | 条件数 | Ch.3 | [通行] |
| iterative method | 迭代法 | Ch.5 | [通行] |
| Jacobi (method) | 雅可比（法） | Ch.5 | [通行] |
| Gauss–Seidel (method) | 高斯–赛德尔（法） | Ch.5 | [通行] |
| Krylov subspace | Krylov 子空间 | Ch.6 | [通行] |
| conjugate gradient (method) | 共轭梯度法 | Ch.6 | [通行] |
| symmetric | 对称的 | Ch.8 | [通行] |
| nonsymmetric | 非对称的 | Ch.7 | [通行] |
| spectrum | 谱 | [通行] | 待定 |
| spectral radius | 谱半径 | [通行] | 待定 |
| orthogonal | 正交的 | [快照] | 待定 |
| orthonormal | 标准正交的 / 正交规范的 | [通行] | 待定 |
| projection | 投影 | [快照] | 待定 |
| subspace | 子空间 | [快照] | 待定 |

---

## 四、章节标题中译（用于 `\chapter{}`）

| 章 | 英文章题 | 中译 |
|----|----------|------|
| 1  | Introduction | 绪论（或 引言） |
| 2  | Gaussian Elimination | 高斯消去法 |
| 3  | Perturbation and Error Analysis | 扰动与误差分析 |
| 4  | Least Squares Problems | 最小二乘问题 |
| 5  | Classical Iterative Methods | 经典迭代法 |
| 6  | Krylov Subspace Methods | Krylov 子空间方法 |
| 7  | Nonsymmetric Eigenvalue Problems | 非对称特征值问题 |
| 8  | Symmetric Eigenvalue Problems | 对称特征值问题 |
| 9  | Applications in ODEs and DDEs | 在常微分方程与时滞微分方程中的应用 |
| 10 | Applications in FDEs | 在分数阶微分方程中的应用（FDE 待确证） |

---

## 五、Ch.1 实际启用术语（页 = 源书书页）

> 本章已定稿翻译，下列条目已在 `chapters/ch01.tex` 用 `\newterm{key}{中文}{英文}` 落定，
> 页码为源书书页（物理页 = 书页 + 14）。其余章仍为"待定"。

| 键 | 中文（正文用字） | 英文 | 书页 |
|----|------------------|------|------|
| matrixcomputation | 矩阵计算 | matrix computation | 1 |
| matrix | 矩阵 | matrix | 1 |
| entry | 元素 | entry | 1 |
| transpose | 转置 | transpose | 1 |
| conjtranspose | 共轭转置 | conjugate transpose | 1 |
| rank | 秩 | rank | 1 |
| determinant | 行列式 | determinant | 1 |
| diagmatrix | 对角矩阵 | diagonal matrix | 2 |
| identity | 单位矩阵 | identity matrix | 2 |
| zeromatrix | 零矩阵 | zero matrix | 2 |
| norm | 范数 | norm | 2 |
| eigenvalue | 特征值 | eigenvalue | 3 |
| eigenvector | 特征向量 | eigenvector | 3 |
| jordanform | Jordan 标准形 | Jordan canonical form | 4 |
| jordanblock | Jordan 块 | Jordan block | 4 |
| condnum | 条件数 | condition number | 5 |
| stable | 稳定的 | stable | 5 |

**本章新定名（未用 `\newterm`，但已固定译法）：**

| 英文 | 中文 | 书页 |
|------|------|------|
| Cramer rule | Cramer 法则 | 3 |
| matrix factorization (decomposition) | 矩阵分解 | 4 |
| perturbation analysis | 扰动分析 | 5 |
| error analysis | 误差分析 | 5 |
| rounding error / chopping error | 舍入误差 / 截断误差 | 5 |
| ill-conditioned / well-conditioned | 病态的 / 良态的 | 5 |
| operation cost | 运算量 | 6 |
| direct method / iterative method | 直接法 / 迭代法 | 6 |
| convergence rate (linear / superlinear) | 收敛速度（线性 / 超线性） | 6 |
| strictly upper triangular | 严格上三角 | 6 |
| nilpotent | 幂零 | 7 |
| Hermitian positive definite / semi-definite | Hermite 正定 / 半正定 | 7 |
| skew-Hermitian | 反 Hermite | 7 |
| idempotent | 幂等 | 8 |
| unitary | 酉 | 8 |
| polar decomposition | 极分解 | 8 |

---

## 六、Ch.2 实际启用术语（页 = 源书书页）

> 源书 Chapter 2 = 书页 9–22（物理页 23–36）。下列条目已在 `chapters/ch02.tex` 用
> `\newterm{key}{中文}{英文}` 落定，页码为源书书页。

| 键 | 中文（正文用字） | 英文 | 书页 |
|----|------------------|------|------|
| directmethod | 直接法 | direct method | 9 |
| iterativemethod | 迭代法 | iterative method | 9 |
| gaussianelimination | 高斯消去法 | Gaussian elimination | 9 |
| forwardsubstitution | 前代法 | forward substitution | 10 |
| backwardsubstitution | 回代法 | backward substitution | 10 |
| gaussiantransform | 高斯变换矩阵 | Gaussian transform matrix | 11 |
| unittriangular | 单位三角矩阵 | unit triangular matrix | 11 |
| rankonemodification | 秩一修正 | rank-one modification | 11 |
| leadingprincipal | 顺序主子矩阵 | leading principal submatrix | 14 |
| permutationmatrix | 置换矩阵 | permutation matrix | 16 |
| completepivoting | 全主元选取 | complete pivoting | 18 |
| symmetricpositivedefinite | 对称正定 | symmetric positive definite | 19 |
| choleskyfactorization | Cholesky 分解 | Cholesky factorization | 19 |
| strictlydiagdominant | 严格对角占优 | strictly diagonally dominant | 21 |
| schurcomplement | Schur 补 | Schur complement | 21 |

**本章新定名（未用 `\newterm`，但已固定译法）：**

| 英文 | 中文 | 书页 |
|------|------|------|
| pivoting | 主元选取（选主元） | 15 |
| partial pivoting | 部分主元选取（列主元） | 18 |
| rank revealing LU factorization | 秩揭示 $LU$ 分解 | 19 |
| tridiagonal system | 三对角方程组 | 22 |
| dense linear system | 稠密线性方程组 | 9 |
| forward / backward substitution | 前代法 / 回代法 | 10 |
| leading principal submatrix $A_k$ | 顺序主子矩阵 $A_k$ | 14 |
| $LU$ factorization / $LDL^T$ factorization | $LU$ 分解 / $LDL^T$ 分解 | 9 / 21 |
| positive diagonal entries | 对角元为正 | 19 |
| probabilistic analysis | 概率分析 | 19 |

---

## 七、Ch.4 实际启用术语（章内首现即 
ewterm）

| key | 中文 | English |
|-----|------|---------|
| residual | 残差 | residual |
| leastsquares | 最小二乘问题 | least squares problem |
| range | 值域 | range |
| nullspace | 零空间 | nullspace |
| nullity | 零度 | nullity |
| orthcomplement | 正交补 | orthogonal complement |
| moorepenrose | Moore–Penrose 广义逆 | Moore–Penrose generalized inverse |
| orthprojection | 正交投影 | orthogonal projection |
| householder | Householder 变换 | Householder transformation |
| reflection | 反射 | reflection |
| givens | Givens 旋转 | Givens rotation |
| unitarymatrix | 酉矩阵 | unitary matrix |
| idempotent | 幂等的 | idempotent |

> 复用未新造：`illconditioned` / `wellconditioned`（Ch.3）、`orthogonalmatrix`（Ch.1）、`condnum`（Ch.3）。

## 八、Ch.5 实际启用术语（章内首现即 \newterm）

| key | 中文 | English |
|-----|------|---------|
| jacobimethod | Jacobi 方法 | Jacobi method |
| gaussseidelmethod | Gauss-Seidel 方法 | Gauss-Seidel method |
| linearstationary | 线性定常迭代 | linear stationary iteration |
| iterationmatrix | 迭代矩阵 | iteration matrix |
| weaklydiagdominant | 弱对角占优的 | weakly diagonally dominant |
| irreducible | 不可约的 | irreducible |
| averagerate | 平均收敛速度 | average rate of convergence |
| asymptoticrate | 渐近收敛速度 | asymptotic convergence rate |
| relaxationparameter | 松弛因子 | relaxation parameter |
| successiveoverrelaxation | 逐次超松弛方法 | successive overrelaxation (SOR) method |
| underrelaxation | 低松弛 | underrelaxation |
| overrelaxation | 超松弛 | overrelaxation |
| propertya | 性质 A | property A |
| consistentordering | 相容次序 | consistent ordering |
| blocktridiagonal | 块三对角矩阵 | block tridiagonal matrix |

> 复用未新造：`iterativemethod`（Ch.2）、`strictlydiagdominant`（Ch.2）、`symmetricpositivedefinite`（Ch.2）、`spectralradius` / `spectrum`（Ch.3）、`permutationmatrix`（Ch.2）。

## 九、Ch.6 实际启用术语（章内首现即 \newterm）

| key | 中文 | English |
|-----|------|---------|
| krylovmethod | Krylov 子空间方法 | Krylov subspace method |
| krylovsubspace | Krylov 子空间 | Krylov subspace |
| linesearch | 线搜索方向 | line search direction |
| stepsize | 步长 | step size |
| steepestdescent | 最速下降法 | steepest descent method |
| energynorm | 能量范数 | energy norm |
| conjugategradient | 共轭梯度法 | conjugate gradient (CG) method |
| preconditioning | 预处理 | preconditioning |
| preconditioner | 预条件子 | preconditioner |
| pcg | 预处理共轭梯度（PCG）法 | preconditioned conjugate gradient (PCG) method |
| incompletecholesky | 不完全 Cholesky 分解 | incomplete Cholesky factorization |
| circulant | 循环矩阵 | circulant matrix |
| fouriermatrix | Fourier 矩阵 | Fourier matrix |
| fft | 快速 Fourier 变换（FFT） | fast Fourier transform (FFT) |
| optimalprecond | 最优预条件子 | optimal preconditioner |
| optimalcirculant | 最优循环预条件子 | optimal circulant preconditioner |
| gmres | 广义极小残量（GMRES）法 | generalized minimum residual (GMRES) method |
| normalmatrix | 正规矩阵 | normal matrix |
| minimalpoly | 极小多项式 | minimal polynomial |
| breakdown | 中断 | breakdown |

> 复用未新造：`conjugategradient` 之外的正交/酉类术语沿用 Ch.4（`orthogonalmatrix`、`unitarymatrix`）；
> 条件数 `condnum`、谱半径 `spectralradius`、特征值 `eigenvalue` 系列沿用 Ch.3、Ch.5。

## 十、Ch.7 实际启用术语（章内首现即 \newterm）

| key | 中文 | English |
|-----|------|---------|
| algebraicmultiplicity | 代数重数 | algebraic multiplicity |
| geometricmultiplicity | 几何重数 | geometric multiplicity |
| eigenspace | 特征子空间 | eigenspace |
| simpleeigenvalue | 单特征值 | simple eigenvalue |
| defective | 亏损的 | defective |
| nondefective | 非亏损的 | nondefective |
| similarmatrix | 相似矩阵 | similar matrices |
| similaritytransformation | 相似变换 | similarity transformation |
| powermethod | 幂法 | power method |
| inversepowermethod | 反幂法 | inverse power method |
| shift | 位移 | shift |
| hessenberg | 上 Hessenberg 矩阵 | upper Hessenberg matrix |
| hessenbergdecomp | 上 Hessenberg 分解 | upper Hessenberg decomposition |

> 复用未新造：`eigenvalue` / `eigenvector`（Ch.3）、`jordanform` / `jordanblock`（Ch.1）、
> `unitarymatrix`（Ch.4）、`orthogonalmatrix`（Ch.1）、`householder` / `givens`（Ch.4）、
> `spectralradius`（Ch.3）、`irreducible`（Ch.5）、`normalmatrix`（Ch.6）。
> 注意：QR 方法与 QR 分解在源书中以 `$QR$`（数学斜体）排印，正文一律写作「QR 方法」「QR 分解」，
> 未另立 `qrmethod` 键，以免与 Ch.3 的 QR 分解记号重复索引。

## 十一、Ch.8 实际启用术语（章内首现即 \newterm）

> 源书 Chapter 8 = 书页 121–143（物理页 135–157）；译文章页 103–121（2026-11-04 标点改版后 §8.4 起 +1）。
> 「书页」为源书页码，「译文页」为本工程 main.pdf 的页码（前置于正文前的罗马页码另计）。

| key | 中文 | English | 书页 | 译文页 |
|-----|------|---------|------|--------|
| rayleighquot | Rayleigh 商 | Rayleigh quotient | 121 | 103 |
| svdecomp | 奇异值分解 | singular value decomposition | 123 | 104 |
| symqrmethod | 对称 QR 方法 | symmetric QR method | 123 | 105 |
| wilkinsonshift | Wilkinson 位移 | Wilkinson shift | 125 | 106 |
| spectraldecomp | 谱分解 | spectral decomposition | 128 | 108 |
| classicaljacobi | 经典 Jacobi 方法 | classical Jacobi method | 131 | 111 |
| bisection | 对分法 | bisection method | 133 | 112 |
| interlace | 交错性质 | interlacing property | 133 | 113 |
| divideconquer | 分治方法 | divide-and-conquer method | 135 | 114 |

> 复用未新造：`eigenvalue` / `eigenvector`（Ch.1/3）、`spectralradius` / `spectrum`（Ch.3）、
> `orthogonalmatrix`（Ch.1）、`unitarymatrix`（Ch.4）、`givens` / `householder`（Ch.4）、
> `hessenberg`（Ch.7）、`jacobimethod`（Ch.5，源书 Ch.8 的 Jacobi 方法同名，中文仍作「Jacobi 方法」，
> 为避免索引重复未另立键）、`machineprecision`（Ch.3）、`irreducible`（Ch.5）、
> `frobeniusnorm`（Ch.3）、`rankonemodification`（Ch.2，此处「秩一矩阵」为普通表述）。
>
> 说明：`spectraldecomp` 的中文「谱分解」在源书页 128 首次以正文形式出现（定理 8.1 仅以定理名
> 「Spectral Decomposition Theorem」出现），故索引页码落在 128 而非 121。

## 十二、Ch.9 实际启用术语（章内首现即 \newterm）

| key | 中文 | English |
|-----|------|---------|
| bvm | 边值法 | boundary value method (BVM) |
| astable | $A_{\nu_1,\nu_2}$-稳定 | $A_{\nu_1,\nu_2}$-stable |
| dde | 时滞微分方程 | delay differential equation (DDE) |
| ivm | 初值法 | initial value method (IVM) |
| lmf | 线性多步公式 | linear multistep formula (LMF) |
| toeplitzmatrix | Toeplitz 矩阵 | Toeplitz matrix |
| bdf | 向后差分公式 | backward differentiation formula (BDF) |
| gbdf | 广义向后差分公式 | generalized backward differentiation formula (GBDF) |
| tensorproduct | 张量积 | tensor product |
| strangblock | Strang 型块循环预条件子 | Strang-type block-circulant preconditioner |
| strangcirc | 循环预条件子 | circulant preconditioner |
| boundarylocus | 边界轨迹 | boundary locus |
| gam | 广义 Adams 方法 | generalized Adams method (GAM) |
| ndde | 中立型时滞微分方程 | neutral delay differential equation (NDDE) |
| spdde | 奇摄动时滞微分方程 | singular perturbation delay differential equation (SPDDE) |

> 复用未新造：`preconditioner`（Ch.5/6）、`circulant`（Ch.6，循环矩阵）、`fft`（Ch.6）、
> `gmres`（Ch.6）、`spectrum` / `spectralradius`（Ch.3）、`stable`（Ch.4）、
> `symmetricpositivedefinite`（Ch.2）。
> 说明：`A_{\nu_1,\nu_2}`-稳定、`(ν_1,ν_2)`-边界条件、块-BVM（block-BVM）、GBDF/BDF/GAM
> 等缩写一律保留拉丁原形；`\nu_1,\nu_2,m_1,m_2,k_1,k_2` 等参数记号不立索引项，避免与
> Ch.3 的奇异值下标冲突。`定义 9.1` 以「$A_{\nu_1,\nu_2}$-稳定区域」为副标题，索引项沿用 `astable`。

## 十三、Ch.10 实际启用术语（章内首现即 \newterm）

| key | 中文 | English | 首现书页 | 首现译文页 |
|-----|------|---------|---------|-----------|
| riemannliouville | Riemann--Liouville 分数阶导数 | Riemann--Liouville fractional derivative | 170 | 143 |
| gammafunction | Gamma 函数 | Gamma function | 170 | 143 |
| shiftedgrunwald | 移位 Grünwald 差分格式 | shifted Grünwald difference scheme | 171 | 144 |
| toeplitzlike | 类 Toeplitz 结构 | Toeplitz-like structure | 171 | 144 |
| bandedprecond | 带状预条件子 | banded preconditioner | 171 | 144 |
| ilufact | 不完全 LU 分解 | incomplete LU factorization | 171 | 144 |
| mmatrix | M-矩阵 | M-matrix | 175 | 146 |

> 复用未新造：`preconditioner`（Ch.5/6/9）、`toeplitzmatrix`（Ch.9）、`gmres`（Ch.6）、
> `restarted`（Ch.6，重启）、`strictlydiagdominant`（Ch.2）、`spectralradius`（Ch.3）、
> `fft`（Ch.6）、`tensorproduct`（Ch.9）。
> 说明：`FDE` 在源书为 **Fractional Diffusion Equation**（分数阶扩散方程），已据 Ch.10 正文确证；
> 泛函微分方程在源书中另有 DDE/NDDE/SPDDE 三种缩写，不与此冲突。
> `CN-WSGD`（Crank--Nicolson weighted shifted Grünwald difference）属格式名称，保留拉丁原形不立索引项。
> 上表「首现译文页」为**术语索引实测值**（非估算；2026-11-04 全书改半角标点后重新实测，见 `ch10.aux` 的 `term:*` 标签）：`bandedprecond` 与 `ilufact` 同在 10.2 节导语（译文页 144）首现，故两者一并登记于该处，10.3.1 处不再重复登记。

## 十四、待确认 / 疑点

- [x] `FDE` 全称已确证为 **Fractional Diffusion Equation**（分数阶扩散方程）——Ch.10 正文与式 (10.1) 明确写出分数阶导数，定稿取 Fractional。
- [ ] Ch.1 章题：`Introduction` 译作"绪论"还是"引言"？（试点暂用"绪论"）
- [ ] 与 `confirmed-terminology.md` 差异项（奇异值、Hermitian、酉、谱半径等）在全书定稿前复核。
- [ ] 术语页码：全表"待定"，译到各章时用 `\newterm{}` 回填并同步至此表。
- [ ] 术语中文定名（如 预条件子/预处理矩阵、托普利兹/Toeplitz、厄米/Hermitian、酉/unitary）在全书首现时统一并固化。

---

## 十五、全书术语归一决策（2026-11-04 翻译审阅）

> 本节记录审阅中的 A 类（一义多译）归一与 B 类（一译多义）区分，
> 供后续审校**不要回改**。判定依据为源书扫描页图 + 译稿自身工件（`\newterm` 首登、术语索引）。

### A 类：归一

| 英文概念 | 归一定名 | 原分裂写法 | 依据 |
|---|---|---|---|
| residual | 残差 | 残量（Ch.6/9/10、符号表共 8 处） | Ch.4 `\newterm{residual}{残差}{residual}` 首登；术语索引印「残差」；符号表已用「残差」 |
| direct method | 直接法 | 直接方法（Ch.5 ×3） | Ch.2 首登「直接法」；全书 15 处 |
| iterative method | 迭代法 | 迭代方法（Ch.5/7/10 ×4） | Ch.2 首登「迭代法」；全书 26 处 |
| GMRES（种子表） | 广义极小残量 (GMRES) 法 | 种子表曾写「广义极小残差法」 | 正文 Ch.6 `\newterm{gmres}` 与前言均作「残量」，术语索引以正文为准 |
| MINRES（种子表） | 最小残量法 | 种子表曾写「最小残差法」 | 与 GMRES 专名族保持一致 |

### B 类：区分（**不得**归一）

| 中文 | 对应英文 | 出现处 | 说明 |
|---|---|---|---|
| 残量 | generalized minimum residual（**算法专名**） | Ch.6 ×2、前言 ×1 | 「广义极小残量 (GMRES) 法」是算法名称，作为已登记例外保留；全文仅此 3 处 |
| 直接解法 | direct **solvers** | Ch.9 ×2 | 源书 p.149 附近原文为 "direct solvers"，与 direct methods 不同义项 |
| 浮点运算 | floating point **operations** | Ch.3 章导言、前言、符号表分组名 | 与下项区分 |
| 浮点算术 | floating point **arithmetic** | Ch.2 两处例题、Ch.3 §3.3 标题、Ch.3 §3.3 末 [65] | 源书 §3.3 标题与目录均作 arithmetic（源 PDF 物理页 48 = 书页 34 已核页图） |
| 解空间 | solution **space** | Ch.7 ×1 | 与 `nullspace` = 零空间（Ch.4）不同概念 |
| 零空间 / 值域 / 列空间 | nullspace / range / column space | Ch.4、符号表 | 符号表「$A$ 的值域, 即列空间」是释义，不是第二个术语 |
| 高斯消去（无「法」） | Gaussian elimination（**过程**） | Ch.2 习题、Ch.3 | 「经过 $k$ 步高斯消去」指过程，非方法名，保留 |
| 循环 / 循环矩阵 | circulant | Ch.6、Ch.9 | 「块循环预条件子」「循环矩阵」为复合词，非术语分裂 |

### 有意保留的源书自身疑点（忠实照排，未改）

定理 8.9(ii) 末项 $\pi(r)$ 与 $\pi(n)$ 不协调；定理 8.6 后 $\sigma_i$ 范围与秩 $r$ 不符；
式 (8.7) 标量位置；$\|B-A\|_F^2$ 求和项作 $a_{ij}^2$；定理 9.5 证明中 $m$ 与 $k_1$ 混用；
例 9.2 的 $J_n$ 上下副对角线不对称（上 2 / 下 1）；引理 10.1 下标为 $w_3,w_4$。
