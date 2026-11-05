% !TeX program = xelatex
% ================================================================
%  mathtranslation.cls
%  数译（mathtranslation.org）数学中文译本排版类
% ----------------------------------------------------------------
%  v3.3（2026/11/04）—— 细节完善与稳定性升级：
%      · 新增 ShowCompileDate 布尔类选项（及 \CompileDate 宏，默认 \today），
%        支持在封面独立显示编译日期；TranslationDate 则仅在非空时显示；
%      · proof、example 与 remark 统一由 amsthm 的 \pushQED / \popQED 栈驱动，
%        模仿 ntheorem 的 nonumberplain + \theoremsymbol 视觉与行为：
%        既支持手动 \qedhere，也能在末尾行间公式（\[...\]、align* 等）未写
%        \qedhere 时自动将 \square / \diamond 归位到公式行末，消除多余空行；
%      · proof 环境分隔符抽离为 \proofSeparator（默认 \enspace，可切回全角冒号）；
%      · 修复 \makecontents 目录首页仍显示 plain 页码的问题；
%      · 修复 \makecover 封面长书名自动换行时次行缩进丢失的问题；
%      · 修复 exercises / answers 环境在多段落习题下悬挂缩进丢失的问题；
%      · 补齐 exercise 的 cleveref 中文名及 subsubsection 的 \headfont 设置。
%  v3.2（2026/09/12）—— 后置部分不再占用章号。
%      \makebibliography 与 \printterminology 现在自动进入 \backmatter，
%      并以无编号章排版（\chapter* + 目录条目 + 页眉标记），参考文献与
%      术语索引不会再出现"第九章/第十章"式的编号溢出。
%      \makebibliography 另提供 \BibliographyNote 钩子（默认为空），
%      可在导言区 \renewcommand，用于在条目列表前放置项目说明文字。
%  v3.1（2026/09/11）—— 标题与定理名改用黑体。
%      旧文件一律用 \songfont\bfseries 排标题，那其实是「宋体加粗」，黑体
%      从未真正上场。现由 \headfont 统一提供：中文取黑体族（HeadingFont
%      选项，默认 hei），西文仍随主字体加粗，让标题里的数字与正文数学同族。
%  v3.0（2026/09/11）—— 由下列两份类文件的优点合并而成：
%
%   A. mathtranslation.cls v1.2（ctexbook，书籍类）
%        取用：kvoptions 类选项化元信息、xcolor 命名色主题、
%              ctexbook 基础类与 part/chapter 版面、fancyhdr 页眉页脚、
%              bibtex / biblatex 双兼容、cleveref 中文名、\endinput。
%
%   B. mathtranslations-translation-template.cls（ctexart，文章类）
%        取用：\newterm 自动术语索引（自动页码、自动去重）、
%              长证明与习题/答案双向跳转、附录时目录前缀切换、
%              双定理样式、\envenddiamond 结束标记、
%              Fandol 全套字体（含无衬线/等宽）。
%
%  用法：
%    \documentclass[
%      BookTitleCN=代数学,
%      OriginalAuthor=Serge Lang,
%      ShowCompileDate=true
%    ]{mathtranslation}
%  或保留旧写法（封面宏走同名别名，两种方式等价）：
%    \documentclass{mathtranslation}
%    \renewcommand{\BookTitleCN}{代数学}
% ================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mathtranslation}[2026/11/04 v3.3 数译数学中文译本排版类]

% 类文件里 @ 本来就是 catcode 11，这里只作保险，绝不调用 \makeatother。
\makeatletter

% ================================================================
%  1. 类选项
% ================================================================
\RequirePackage{kvoptions}
\SetupKeyvalOptions{family=MT, prefix=MT@}

\DeclareStringOption[MidnightBlue]{ThemeColor}   % 主题色：章节号、链接、页码
\DeclareStringOption[a4paper]{PaperSize}         % 纸张
\DeclareStringOption[数译]{Translator}           % 译者署名

% 标题与定理名所用的中文字体族：
%   hei（默认）常规黑体 ｜ heibold 黑体加粗 ｜ song 宋体加粗（旧版观感）
%   kai 楷体 ｜ fang 仿宋
% 西文部分不受此项影响，始终随主字体的 \bfseries，与正文数学字体同族。
\DeclareStringOption[hei]{HeadingFont}

% 以下书目信息默认为空，刻意不预置任何示例值，避免模板与实例耦合。
\DeclareStringOption{BookTitleCN}
\DeclareStringOption{BookTitleEN}
\DeclareStringOption{OriginalAuthor}
\DeclareStringOption{OriginalEdition}
\DeclareStringOption{OriginalPublisher}
\DeclareStringOption{OriginalYear}
\DeclareStringOption{ModelUsed}
\DeclareStringOption{TranslationDate}

% 是否在封面显示编译日期（传 ShowCompileDate 或 ShowCompileDate=true 开启）
\DeclareBoolOption[false]{ShowCompileDate}
\DeclareStringOption[\today]{CompileDate}

% 封面 logo：先试 graphics/ 再试本级目录，都找不到就画占位框。
\DeclareStringOption[logo.pdf]{LogoFile}
\DeclareStringOption[5.7cm]{LogoWidth}

% 参考文献：默认走 biblatex + biber；传 Biblatex=false 退回 bibtex。
\DeclareBoolOption[true]{Biblatex}
\DeclareStringOption[alphabetic]{BibStyle}
\DeclareStringOption[references]{BibFile}

% 带 * 号：只处理 family=MT，不把本类的选项继续透传给 ctexbook。
% 注意星号形式不接受参数，family 由上面的 \SetupKeyvalOptions 指定。
\ProcessKeyvalOptions*

% ================================================================
%  2. 基础类与页面
% ================================================================
\PassOptionsToPackage{dvipsnames}{xcolor}
\LoadClass[UTF8,11pt,fontset=none]{ctexbook}

% 用 \edef 展开纸张选项，避免宏在宏包选项列表里未被展开。
\edef\MT@geomopts{\MT@PaperSize,left=2.5cm,right=2.5cm,top=2.8cm,bottom=2.8cm,headheight=15pt}
\expandafter\RequirePackage\expandafter[\MT@geomopts]{geometry}
\setlength{\headsep}{12pt}

\setlength{\parindent}{2em}
\setlength{\parskip}{0pt}
\linespread{1.16}

% ================================================================
%  3. 字体
% ================================================================
\RequirePackage{fontspec}
\RequirePackage{xeCJK}

% 英文：Computer Modern Unicode Serif
\setmainfont{cmunrm.otf}[
  BoldFont=cmunbx.otf,
  ItalicFont=cmunti.otf,
  BoldItalicFont=cmunbi.otf
]

% 中文：正文宋体；术语楷体；定理类正文仿宋。
% 全部使用 TeX Live 自带 Fandol，不依赖 macOS / Windows 专有字体。
\setCJKmainfont{FandolSong-Regular.otf}[BoldFont=FandolSong-Bold.otf,ItalicFont=FandolKai-Regular.otf]
\newCJKfontfamily\songfont{FandolSong-Regular.otf}[BoldFont=FandolSong-Bold.otf,ItalicFont=FandolKai-Regular.otf]
\newCJKfontfamily\termfont{FandolKai-Regular.otf}
\newCJKfontfamily\theoremfont[AutoFakeBold=2,ItalicFont=FandolKai-Regular.otf]{FandolFang-Regular.otf}
\setCJKsansfont{FandolHei-Regular.otf}[BoldFont=FandolHei-Bold.otf]
\setCJKmonofont{FandolFang-Regular.otf}

% ---------- 标题与定理名用字体 ----------
%   \heifont      常规黑体。BoldFont 刻意指回自身，于是 \bfseries 只让西文
%                 （数字、拉丁词）变粗，中文始终保持常规黑体。中文标题不必
%                 “黑体再加粗”：FandolHei-Bold 会把笔画交叠处糊在一起，
%                 大字号下这种糊尤其显眼。
%   \heiboldfont  黑体加粗，留给偏好更重视觉效果的人。
%
% 西文刻意不动：仍走主字体的 \bfseries，于是标题里的数字、拉丁词与正文
% 数学字体同族，不会为了一个标题再引入一套西文字体。
\newCJKfontfamily\heifont{FandolHei-Regular.otf}[BoldFont=FandolHei-Regular.otf]
\newCJKfontfamily\heiboldfont{FandolHei-Regular.otf}[BoldFont=FandolHei-Bold.otf]

% 中文标题族由 HeadingFont 选项挑。派发放在 \AtBeginDocument：选项值在
% 第 1 节就已确定，但 \ifdefstring 要等第 4 节载入 etoolbox 才可用。
\newcommand{\headcjk}{\heifont}
\AtBeginDocument{%
  \ifdefstring{\MT@HeadingFont}{heibold}{\renewcommand{\headcjk}{\heiboldfont}}{}%
  \ifdefstring{\MT@HeadingFont}{song}{\renewcommand{\headcjk}{\songfont}}{}%
  \ifdefstring{\MT@HeadingFont}{kai}{\renewcommand{\headcjk}{\termfont}}{}%
  \ifdefstring{\MT@HeadingFont}{fang}{\renewcommand{\headcjk}{\theoremfont}}{}%
}

% 标题与定理名的唯一入口。第 11 / 13 / 15 节全部改用它，
% 想整体换字体只需在正文导言区 \renewcommand{\headfont}{...}。
\newcommand{\headfont}{\headcjk\bfseries}

% ================================================================
%  4. 数学、图形、表格
% ================================================================
\RequirePackage{amsmath,amsthm,amssymb,mathrsfs,mathtools}
\RequirePackage{graphicx}
\graphicspath{{graphics/}}
\RequirePackage{tikz,tikz-cd,titlesec,etoolbox}
\RequirePackage{array,booktabs,longtable}

% ================================================================
%  5. 颜色与超链接
% ================================================================
\RequirePackage[dvipsnames]{xcolor}

% 用命名色定义主题色，务必在 hyperref 之前，否则 linkcolor 取不到值。
\definecolor{ThemeColor}{named}{\MT@ThemeColor}

\RequirePackage[
    colorlinks=true,
    bookmarksnumbered=true,
    linktoc=all,
    linkcolor=ThemeColor,
    citecolor=BrickRed,  % 文献引用与普通交叉引用区分
    urlcolor=ThemeColor
]{hyperref}
\RequirePackage{bookmark}
\RequirePackage[nameinlink,capitalize]{cleveref}

% ================================================================
%  6. 参考文献
% ================================================================
\ifMT@Biblatex
  \edef\MT@bibopts{backend=biber,style=\MT@BibStyle,sorting=nyt,maxalphanames=2,maxbibnames=99,giveninits=true}
  \expandafter\RequirePackage\expandafter[\MT@bibopts]{biblatex}
  \setlength{\bibitemsep}{0.5\baselineskip}
\fi

% bibtex 回退路径才需要给 \thebibliography 补页眉、目录与书签。
% patchcmd 失败时静默跳过，不会中断编译。
\AtBeginDocument{%
  \ifMT@Biblatex\else
    \patchcmd{\thebibliography}{\chapter*}{\cleardoublepage\phantomsection\chapter*}{}{}%
    \patchcmd{\thebibliography}%
      {\@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}}%
      {\markboth{\bibname}{\bibname}\addcontentsline{toc}{chapter}{\bibname}}{}{}%
  \fi
}

% 参考文献属于后置部分：\makebibliography 自动进入 \backmatter，并以无编号章
% 排版（\chapter* + 目录条目 + 页眉标记），因此它绝不会占用正文章号，
% 不会出现"第九章 参考文献"这类编号溢出。
% \BibliographyNote 可在导言区 \renewcommand，用于在条目列表前放置一段说明
% 文字（默认为空）。
\newcommand{\BibliographyNote}{}
\newcommand{\makebibliography}{%
  \backmatter
  \chapter*{参考文献}%
  \addcontentsline{toc}{chapter}{参考文献}%
  \markboth{参考文献}{参考文献}%
  \ifdefempty{\BibliographyNote}{}{\noindent\BibliographyNote\par\bigskip}%
  \ifMT@Biblatex
    \printbibliography[heading=none]%
  \else
    \bibliographystyle{alpha}%
    \bibliography{\MT@BibFile}%
  \fi
}

% ================================================================
%  7. 译本元信息
% ================================================================
\newcommand{\BookTitleCN}{\MT@BookTitleCN}
\newcommand{\BookTitleEN}{\MT@BookTitleEN}
\newcommand{\OriginalAuthor}{\MT@OriginalAuthor}
\newcommand{\OriginalEdition}{\MT@OriginalEdition}
\newcommand{\OriginalPublisher}{\MT@OriginalPublisher}
\newcommand{\OriginalYear}{\MT@OriginalYear}
\newcommand{\Translator}{\MT@Translator}
\newcommand{\ModelUsed}{\MT@ModelUsed}
\newcommand{\TranslationDate}{\MT@TranslationDate}
\newcommand{\CompileDate}{\MT@CompileDate}

% 逐项拼接版次 · 出版社 · 年份，空字段自动跳过，也不会留下孤立的间隔号。
\newcommand{\MT@joinline}{}
\newcommand{\MT@join}[1]{%
  \ifblank{#1}{}{%
    \ifx\MT@joinline\@empty
      \g@addto@macro\MT@joinline{#1}%
    \else
      \g@addto@macro\MT@joinline{ · #1}%
    \fi
  }%
}

% logo 探测：\IfFileExists 不查 \graphicspath，所以必须显式列出候选路径。
\newcommand{\MT@coverlogo}{%
  \IfFileExists{graphics/\MT@LogoFile}{%
    \includegraphics[width=\MT@LogoWidth]{graphics/\MT@LogoFile}%
  }{%
    \IfFileExists{\MT@LogoFile}{%
      \includegraphics[width=\MT@LogoWidth]{\MT@LogoFile}%
    }{%
      \framebox[\MT@LogoWidth][c]{\rule{0pt}{1.2cm}LOGO}%
    }%
  }%
}

% ================================================================
%  8. 封面
% ================================================================
\newcommand{\makecover}{%
  \begin{titlepage}
    \thispagestyle{empty}%
    \flushleft

    \rule{\textwidth}{1.2pt} \\[0.1cm]
    \rule{\textwidth}{0.8pt} \\[1.5cm]

    % 使用 minipage 包裹标题与作者，防止长书名换行时次行顶到最左侧
    \noindent\hspace*{2cm}%
    \begin{minipage}{\dimexpr\textwidth-2cm\relax}
      \raggedright
      {\fontsize{45pt}{56pt}\selectfont\headfont \BookTitleCN\par}%
      \ifblank{\BookTitleEN}{}{%
        \vspace{0.6cm}%
        {\fontsize{25pt}{32pt}\selectfont\itshape \BookTitleEN\par}%
      }%
    \end{minipage}\\[1.5cm]

    \rule{\textwidth}{0.6pt} \\[2cm]

    \noindent\hspace*{2cm}%
    \begin{minipage}{\dimexpr\textwidth-2cm\relax}
      \raggedright
      {\Huge\textsc{\OriginalAuthor}\par}%
    \end{minipage}

    \vfill

    \noindent
    \begin{minipage}[b]{0.46\textwidth}
      \raggedright
      \MT@coverlogo
    \end{minipage}%
    \hfill
    \begin{minipage}[b]{0.50\textwidth}
      \raggedleft
      \gdef\MT@joinline{}%
      \MT@join{\OriginalEdition}\MT@join{\OriginalPublisher}\MT@join{\OriginalYear}%
      \ifx\MT@joinline\@empty\else{\small \MT@joinline} \\[0.25cm]\fi
      {\normalsize \Translator\ 翻译及重排}%
      \ifdefempty{\ModelUsed}{}{\ \\[0.25cm]{\small Model: \ModelUsed}}%
      \ifdefempty{\TranslationDate}{}{\ \\[0.25cm]{\small Updated: \TranslationDate}}%
      \ifMT@ShowCompileDate
        \ \\[0.25cm]{\small Compiled: \CompileDate}%
      \fi
    \end{minipage}

    \vspace*{1cm}
  \end{titlepage}%
}
\providecommand{\maketitle}{}
\renewcommand{\maketitle}{\makecover}

% ================================================================
%  9. 页眉页脚
% ================================================================
\newif\ifInAppendix
\InAppendixfalse

\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\chaptermark}[1]{%
  \if@mainmatter
    \ifInAppendix
      \markboth{附录 \thechapter\quad #1}{}%
    \else
      \markboth{第 \thechapter 章\quad #1}{}%
    \fi
  \else
    \markboth{#1}{}%
  \fi
}
\renewcommand{\sectionmark}[1]{\markright{\thesection\quad #1}}
\fancyhead[LE,RO]{\small \thepage}
\fancyhead[RE]{\small\leftmark}
\fancyhead[LO]{\small\rightmark}
\renewcommand{\headrulewidth}{0.4pt}
\fancypagestyle{plain}{% 章节首页样式
  \fancyhf{}
  \fancyfoot[C]{\small \thepage}
  \renewcommand{\headrulewidth}{0pt}
}

% ================================================================
% 10. 术语系统
% ================================================================
% 两套入口，按需要选用：
%
%   \newterm{唯一键}{中文术语}{English term}
%       在术语“第一次出现”的位置调用，自动记标签、自动取页码、自动去重。
%       后续再出现同一个词，直接写中文即可，不要再调用 \newterm。
%
%   \addterm{中文术语}{English term}{页码文字}
%       手工兜底：需要固定页码或词条不来自 \newterm 时使用。

\newcommand{\termcn}[1]{{\termfont #1}}

\newcommand{\MTTermList}{}
\newcommand{\MTRegisterTerm}[3]{%
  \g@addto@macro\MTTermList{\MTTermRow{#1}{#2}{#3}}%
}
\newcommand{\MTTermRow}[3]{%
  {\termfont #1} & #2 & \hyperref[#3]{\pageref*{#3}} \\
}

% 登记信息经 .aux 回传，因此需要至少两遍编译页码才会稳定。
\newcommand{\newterm}[3]{%
  \@ifundefined{MT@seen@#1}{%
    \expandafter\gdef\csname MT@seen@#1\endcsname{}%
    \phantomsection
    \label{term:#1}%
    \protected@write\@auxout{}{%
      \string\MTRegisterTerm{\unexpanded{#2}}{\unexpanded{#3}}{term:#1}%
    }%
  }{}%
  {\termfont #2}（#3）%
}

\newcommand{\addterm}[3]{%
  \g@addto@macro\MTTermList{{\termfont #1} & #2 & #3 \\}%
}

% 术语索引属于后置部分：无编号章（\chapter* + 目录条目 + 页眉标记），
% 不占用章号。词条顺序即术语在正文中第一次出现的顺序（\addterm 词条排在最后）。
\newcommand{\printterminology}{%
  \backmatter
  \cleardoublepage
  \phantomsection
  \chapter*{术语索引}
  \addcontentsline{toc}{chapter}{术语索引}
  \markboth{术语索引}{术语索引}
  \vspace{0.5cm}
  \begingroup
  \renewcommand{\arraystretch}{1.28}%
  \begin{longtable}{%
      >{\raggedright\arraybackslash}p{0.28\textwidth}%
      >{\raggedright\arraybackslash}p{0.49\textwidth}%
      >{\centering\arraybackslash}p{0.12\textwidth}}
    \toprule
    {\headfont 中文术语} & {\headfont 英文术语} & {\headfont 页码} \\
    \midrule
    \endfirsthead
    \toprule
    {\headfont 中文术语} & {\headfont 英文术语} & {\headfont 页码} \\
    \midrule
    \endhead
    \MTTermList
    \bottomrule
  \end{longtable}
  \endgroup
}

% ================================================================
% 11. 定理类环境
% ================================================================
% 定义、引理、定理、推论、命题、注：仿宋正文。
% 例、问题：宋体正文（与正文同字体，读起来更像“例子”）。
% 编号挂在小节上，因此显示为“章.节.序号”，例如 1.1.3。
% “定义 1.1.1”这一串里的中文用黑体，由 \headfont 统一供给（见第 3 节）；
% 后面的编号走西文加粗，与正文数学字体同族。

\newtheoremstyle{mtfang}%
  {6pt}{6pt}% 上下间距
  {\theoremfont}% 正文字体
  {0pt}% 缩进
  {\headfont}% 标题字体
  {.}% 标题后的标点
  {0.5em}% 标题与正文间距
  {}%

\newtheoremstyle{mtsong}%
  {6pt}{6pt}%
  {\songfont}%
  {0pt}%
  {\headfont}%
  {.}%
  {0.5em}%
  {}%

\theoremstyle{mtfang}
\newtheorem{definition}{定义}[section]
\newtheorem{lemma}{引理}[section]
\newtheorem{theorem}{定理}[section]
\newtheorem{corollary}{推论}[section]
\newtheorem{proposition}{命题}[section]
\newtheorem{remark}{注}[section]

\theoremstyle{mtsong}
\newtheorem{example}{例}[section]
\newtheorem{problem}{问题}[section]

% autoref / cleveref 的中文名。计数器的 key 与 \newtheorem 的名字一一对应。
\newcommand{\MT@defautorefname}[2]{%
  \expandafter\def\csname #1autorefname\endcsname{#2}%
}
\MT@defautorefname{definition}{定义}
\MT@defautorefname{lemma}{引理}
\MT@defautorefname{theorem}{定理}
\MT@defautorefname{corollary}{推论}
\MT@defautorefname{proposition}{命题}
\MT@defautorefname{remark}{注}
\MT@defautorefname{example}{例}
\MT@defautorefname{problem}{问题}
\MT@defautorefname{exercise}{习题}
\MT@defautorefname{chapter}{章}
\MT@defautorefname{section}{节}
\MT@defautorefname{subsection}{小节}

\crefname{definition}{定义}{定义}
\crefname{lemma}{引理}{引理}
\crefname{theorem}{定理}{定理}
\crefname{corollary}{推论}{推论}
\crefname{proposition}{命题}{命题}
\crefname{remark}{注}{注}
\crefname{example}{例}{例}
\crefname{problem}{问题}{问题}
\crefname{exercise}{习题}{习题}
\crefname{equation}{式}{式}
\crefname{chapter}{章}{章}
\crefname{section}{节}{节}
\crefname{subsection}{小节}{小节}
\crefname{figure}{图}{图}
\crefname{table}{表}{表}

% ---------- 结束符机制（模仿 ntheorem 的自动公式行末归位 + amsthm 的 \qedhere） ----------
% 在 amsmath 的 \endmathdisplay 末尾（即 $$ 刚结束时的水平模式空行起点）打下
% \spacefactor=998 标记。若后续紧跟 \end{proof} / \end{example} / \end{remark}
% 而无任何正文字符，\spacefactor 仍为 998，此时自动撤回空行并将结束符提至公式行末；
% 若用户已显式写了 \qedhere，则直接由 amsthm 原生机制接管。
\apptocmd{\endmathdisplay}{\spacefactor=998\relax}{}{}

\DeclareRobustCommand{\MT@smartqed}[1]{%
  \ifmmode
    \mathqed
  \else
    \ifhmode
      \ifnum\spacefactor=998\relax
        \par\nobreak
        \vskip-\belowdisplayskip
        \vskip-\baselineskip
        \noindent\strut\hfill\hbox{#1}\par
      \else
        \leavevmode\unskip\penalty9999 \hbox{}\nobreak\hfill\quad\hbox{#1}%
      \fi
    \else
      \leavevmode\unskip\penalty9999 \hbox{}\nobreak\hfill\quad\hbox{#1}%
    \fi
  \fi
}

\renewcommand{\qedsymbol}{\ensuremath{\square}}
\newcommand{\envenddiamond}{\ensuremath{\diamond}}

\DeclareRobustCommand{\qed}{\MT@smartqed{\qedsymbol}}
\DeclareRobustCommand{\diamondqed}{%
  \begingroup
    \renewcommand{\qedsymbol}{\envenddiamond}%
    \MT@smartqed{\envenddiamond}%
  \endgroup
}

\AddToHook{env/example/begin}{\renewcommand{\qedsymbol}{\envenddiamond}\pushQED{\diamondqed}}
\AddToHook{env/example/end}{\popQED}
\AddToHook{env/remark/begin}{\renewcommand{\qedsymbol}{\envenddiamond}\pushQED{\diamondqed}}
\AddToHook{env/remark/end}{\popQED}

% ---------- proof：模仿 nonumberplain 的无冒号空格分隔 + 空心方块结束 ----------
% 默认采用与 \theoremseparator{\enspace} 一致的空格分隔；
% 若某项目仍需旧版全角冒号，可在导言区设：
%   \renewcommand{\proofSeparator}{：\hspace*{\proofColonBack}}
\newlength{\proofColonBack}
\setlength{\proofColonBack}{-0.50em}
\newcommand{\proofSeparator}{\enspace}

\renewcommand{\proofname}{证明}
\renewenvironment{proof}[1][\proofname]{\par
  \pushQED{\qed}%
  \normalfont\songfont
  \topsep6\p@\@plus6\p@\relax
  \trivlist
  \item[\hskip\labelsep\normalfont\headfont #1\proofSeparator]\ignorespaces
}{%
  \popQED\endtrivlist\@endpefalse
}

% ================================================================
% 12. 长证明双向链接
% ================================================================
% 正文（小节末、习题前的位置）：\longprooflink{唯一键}{按钮文字}
% 长证明主体：\begin{longproof}{唯一键}{所证明结果的名称} ... \end{longproof}

\newcommand{\longprooflink}[2]{%
  \par\smallskip
  \hypertarget{longproof-source:#1}{}%
  \begin{flushright}
    \fbox{\hyperref[longproof:#1]{\textcolor{ThemeColor}{#2（第~\pageref*{longproof:#1}~页）}}}%
  \end{flushright}
  \smallskip
}

\newenvironment{longproof}[2]{%
  \def\CurrentLongProofKey{#1}%
  \phantomsection
  \hypertarget{longproof:#1}{}%
  \label{longproof:#1}%
  \begin{proof}[证明（#2）]
}{%
  \end{proof}
  \begin{flushright}
    \fbox{\hyperlink{longproof-source:\CurrentLongProofKey}{\textcolor{ThemeColor}{返回原处}}}%
  \end{flushright}
  \medskip
}

% ================================================================
% 13. 章节样式
% ================================================================
\newlength{\chapterNumSpace}
\setlength{\chapterNumSpace}{1.4cm}

% Part：整页居中，主题色。
\titleformat{\part}[display]
  {\normalfont\centering}
  {\vfill\fontsize{30pt}{30pt}\selectfont\headfont\color{ThemeColor}%
   \if@mainmatter \CTEXthepart \fi}
  {20pt}
  {\fontsize{45pt}{45pt}\selectfont\headfont}
  [\vfill\clearpage]
\titlespacing*{\part}{0pt}{0pt}{0pt}
\assignpagestyle{\part}{empty}

% Chapter：右侧 “Chapter N” 巨号标签 + 通栏细线 + 右对齐标题。
% 附录期间 “Chapter” 自动换成 “Appendix”，并由 \thechapter 给出字母编号。
\newcommand{\ChapterLabel}{%
  \makebox[\textwidth][r]{%
    {\fontsize{18pt}{18pt}\selectfont\scshape
      \ifInAppendix Appendix\else Chapter\fi
    }\enspace
    {\fontsize{62pt}{62pt}\selectfont\bfseries\thechapter}%
  }%
  \par\vspace{-0.25cm}%
  \noindent\rule{\dimexpr\textwidth-\chapterNumSpace\relax}{0.45pt}%
}

\titleformat{\chapter}[display]
  {\normalfont}
  {\ChapterLabel}
  {0.6cm}
  {\raggedleft\rightskip=\chapterNumSpace\fontsize{30pt}{35pt}\selectfont\headfont}
  [\vspace{0.4cm}]
\titlespacing*{\chapter}{0pt}{40pt}{0pt}
\assignpagestyle{\chapter}{plain}

% 无编号的 \chapter*（目录、译者说明、索引等）：通栏细线 + 右对齐标题。
\newcommand{\MT@chapterRule}{%
  \noindent\rule{\textwidth}{0.45pt}%
  \par\vspace{0.5cm}%
}
\titleformat{name=\chapter,numberless}[display]
  {\normalfont}
  {}
  {0pt}
  {\MT@chapterRule\raggedleft\fontsize{28pt}{30pt}\selectfont\headfont}
  [\vspace{0.4cm}]
\titlespacing*{name=\chapter,numberless}{0pt}{40pt}{0pt}

% Section：常规左对齐标题，字号略大于正文。
\titleformat{\section}[block]
  {\normalfont\large\headfont}
  {\thesection}
  {0.6em}
  {}
\titlespacing*{\section}{0pt}{2.2ex plus 1ex minus .2ex}{1.0ex plus .2ex}
\ctexset{
  subsection={format=\large\headfont},
  subsubsection={format=\normalsize\headfont}
}

% ================================================================
% 14. 目录与附录
% ================================================================
\AtBeginDocument{%
  \patchcmd{\l@chapter}{\bfseries}{\headfont}%
    {}{\typeout{MT-WARN: 未能把 \string\l@chapter 的粗体换成黑体}}%
  \patchcmd{\l@part}{\bfseries}{\headfont}%
    {}{\typeout{MT-WARN: 未能把 \string\l@part 的粗体换成黑体}}%
}

% \appendix 之后正文页眉要切到“附录”前缀，并让 PDF 书签回到顶层。
\let\MT@orig@appendix\appendix
\renewcommand{\appendix}{%
  \cleardoublepage
  \MT@orig@appendix
  \InAppendixtrue
  \bookmarksetup{startatroot}%
}

% ================================================================
% 15. 习题与答案双向链接
% ================================================================
\newcounter{exercise}[section]
\renewcommand{\theexercise}{\thesection.\arabic{exercise}}
\newlength{\exerciseLabelWidth}
\newlength{\answerLabelWidth}
\newcounter{answeritem}

% 第一遍编译时答案标签尚不存在，此时退化为纯文字，避免出现 ??
\newcommand{\maybehyperref}[2]{\@ifundefined{r@#1}{#2}{\hyperref[#1]{#2}}}

% 采用 \leftskip + 首行负向回退替代 \hangindent，确保一道习题含多个自然段
% 或内部嵌套 enumerate / itemize 子题时悬挂缩进始终生效。
\newcommand{\exercise@item}{%
  \par\smallskip
  \refstepcounter{exercise}%
  \edef\exercise@number{\theexercise}%
  \edef\exercise@label{exe:\exercise@number}%
  \edef\exercise@answerlabel{ans:\exercise@number}%
  \expandafter\label\expandafter{\exercise@label}%
  \settowidth{\exerciseLabelWidth}{\textbf{\theexercise.}\enspace}%
  \leftskip=\exerciseLabelWidth
  \noindent\hspace*{-\exerciseLabelWidth}%
  \maybehyperref{\exercise@answerlabel}{\textbf{\theexercise.}}\enspace
  \ignorespaces
}

\newenvironment{exercises}{%
  \par\medskip
  \noindent{\large\headfont 习题}\par\smallskip
  \begingroup
  \setlength{\parindent}{0pt}%
  \renewcommand{\item}{\exercise@item}%
}{%
  \par\endgroup\medskip
}

\newcommand{\answer@item}{%
  \par\smallskip
  \stepcounter{answeritem}%
  \edef\answer@number{\answer@prefix.\arabic{answeritem}}%
  \edef\answer@label{ans:\answer@number}%
  \edef\answer@exerciselabel{exe:\answer@number}%
  \phantomsection
  \protected@edef\@currentlabel{\answer@number}%
  \expandafter\label\expandafter{\answer@label}%
  \settowidth{\answerLabelWidth}{\textbf{\answer@number.}\enspace}%
  \leftskip=\answerLabelWidth
  \noindent\hspace*{-\answerLabelWidth}%
  \maybehyperref{\answer@exerciselabel}{\textbf{\answer@number.}}\enspace
  \ignorespaces
}

% 答案环境需给出所属小节编号前缀：\begin{answers}{1.1}
\newenvironment{answers}[1]{%
  \par\medskip
  \def\answer@prefix{#1}%
  \setcounter{answeritem}{0}%
  \begingroup
  \setlength{\parindent}{0pt}%
  \renewcommand{\item}{\answer@item}%
}{%
  \par\endgroup\medskip
}

% ================================================================
% 16. 文档结构接口
% ================================================================
% \frontmatter / \mainmatter / \backmatter 由 ctexbook 原生提供，不再重定义。

% 目录页不排页码、不加页眉（临时覆盖 \chapter* 内部触发的 plain 样式）。
\newcommand{\makecontents}{%
  \cleardoublepage
  \begingroup
    \pagestyle{empty}%
    \fancypagestyle{plain}{%
      \fancyhf{}%
      \renewcommand{\headrulewidth}{0pt}%
    }%
    \tableofcontents
    \cleardoublepage
  \endgroup
}

\endinput
