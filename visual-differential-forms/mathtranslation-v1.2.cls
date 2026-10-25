% !TeX program = xelatex
% 数译（mathtranslation.org）数学中文译本排版类
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mathtranslation}[2026/08/23 v1.2 数译数学中文译本排版类]

% ---------- 1. 处理类选项 ----------
\RequirePackage{kvoptions}
\SetupKeyvalOptions{family=MT, prefix=MT@}

\DeclareStringOption[MidnightBlue]{ThemeColor} % 默认主题色
\DeclareStringOption[a4paper]{PaperSize}       % 默认纸张
\DeclareStringOption{BookTitleCN}
\DeclareStringOption{BookTitleEN}
\DeclareStringOption{OriginalAuthor}
\DeclareStringOption{OriginalEdition}
\DeclareStringOption{OriginalPublisher}
\DeclareStringOption{OriginalYear}
\DeclareStringOption[数译]{Translator}
\DeclareStringOption{ModelUsed}
\DeclareStringOption[\today]{TranslationDate}

\ProcessKeyvalOptions{MT}

% 公开访问宏: 便于文档(main.tex)直接引用书本信息, 如封面/页眉.
% kvoptions 将选项存为 \MT@BookTitleCN 等, 此处提供无前缀公开别名.
\newcommand{\BookTitleCN}{\MT@BookTitleCN}
\newcommand{\BookTitleEN}{\MT@BookTitleEN}
\newcommand{\OriginalAuthor}{\MT@OriginalAuthor}
\newcommand{\OriginalEdition}{\MT@OriginalEdition}
\newcommand{\OriginalPublisher}{\MT@OriginalPublisher}
\newcommand{\OriginalYear}{\MT@OriginalYear}
\newcommand{\Translator}{\MT@Translator}
\newcommand{\ModelUsed}{\MT@ModelUsed}
\newcommand{\TranslationDate}{\MT@TranslationDate}

% ---------- 2. 加载基础类与传参 ----------
\PassOptionsToPackage{dvipsnames}{xcolor}
\PassOptionsToPackage{\MT@PaperSize}{geometry}
\LoadClass[UTF8,11pt,fontset=none]{ctexbook}

% ---------- 3. 基础宏包 ----------
\RequirePackage{geometry}
\geometry{left=2.5cm,right=2.5cm,top=2.8cm,bottom=2.8cm}
\RequirePackage{amsmath,amsthm,amssymb,mathrsfs,mathtools}
\RequirePackage{graphicx,tikz,tikz-cd,titlesec,etoolbox}
\RequirePackage{array,booktabs,longtable}
\RequirePackage{xcolor}

\definecolor{ThemeColor}{named}{\MT@ThemeColor}

\RequirePackage[
    colorlinks=true,
    linkcolor=ThemeColor,
    citecolor=BrickRed,
    urlcolor=ThemeColor,
    linktoc=all,
    bookmarksnumbered=true
]{hyperref}

% bookmark 必须在 hyperref 之后加载, 否则会先无选项触发 hyperref,
% 导致 cls 此处带选项再次加载 hyperref 时报 Option clash.
\RequirePackage{bookmark}

\RequirePackage[nameinlink,capitalize]{cleveref}

% 英文/中文基础字体设置 (保持 Fandol 兼容性)
\setmainfont{cmunrm.otf}[BoldFont=cmunbx.otf,ItalicFont=cmunti.otf,BoldItalicFont=cmunbi.otf]
\setCJKmainfont{FandolSong-Regular.otf}[BoldFont=FandolSong-Bold.otf]
\newCJKfontfamily\songfont{FandolSong-Regular.otf}[BoldFont=FandolSong-Bold.otf]
\newCJKfontfamily\termfont{FandolKai-Regular.otf}
\newCJKfontfamily\theoremfont[AutoFakeBold=2]{FandolFang-Regular.otf}

% ---------- 4. 页眉页脚样式 ----------
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\setlength{\headheight}{15pt}
\fancyhf{}
\renewcommand{\chaptermark}[1]{%
  \if@mainmatter
    \markboth{第 \thechapter 章\quad #1}{}%
  \else
    \markboth{#1}{}%
  \fi
}
% 本书以 \section 为章: 偶数页眉显示章名(第 N 章 / 附录 X)
\renewcommand{\sectionmark}[1]{%
  \ifnum\c@section>\z@
    \markboth{\ifInAppendix 附录 \thesection\else 第 \thesection 章\fi\quad #1}{}%
  \else
    \markboth{#1}{}%
  \fi
}
% 奇数页眉显示当前节(N.M)
\renewcommand{\subsectionmark}[1]{\markright{\thesubsection\quad #1}}
\fancyhead[LE,RO]{\small \thepage}
\fancyhead[RE]{\small\leftmark}
\fancyhead[LO]{\small\rightmark}
\renewcommand{\headrulewidth}{0.4pt}
\fancypagestyle{plain}{% 章节首页样式
  \fancyhf{}
  \fancyfoot[C]{\small \thepage}
  \renewcommand{\headrulewidth}{0pt}
}

% ---------- 5. 定理环境与间距 ----------
% 仿宋正文: 定义/定理/引理/推论/命题/注
% 宋体正文: 例/问题/question
% 环境标题后统一使用中文冒号 (不使用英文句点)
\newtheoremstyle{mtfang}%
  {8pt}{8pt}% 上下间距
  {\theoremfont}%
  {0pt}%
  {\songfont\bfseries}%
  {.}%
  {0.7em}% 标签后间距
  {}%

\newtheoremstyle{mtsong}%
  {8pt}{8pt}%
  {\songfont}%
  {0pt}%
  {\songfont\bfseries}%
  {.}%
  {0.7em}%
  {}%

% 编号归属 (与原书一致): 文档以 \section 表示章, \subsection 表示节, \subsubsection 表示小节
%   定义 按节编号 -> 定义 X.M.K
%   定理/引理/推论/命题/注/例/问题/question 按章编号 -> X.Y
\theoremstyle{mtfang}
\newtheorem{definition}{定义}[subsection]
\newtheorem{theorem}{定理}[section]
\newtheorem{lemma}{引理}[section]
\newtheorem{corollary}{推论}[section]
\newtheorem{proposition}{命题}[section]
\newtheorem{remark}{注}[section]

\theoremstyle{mtsong}
\newtheorem{example}{例}[section]
\newtheorem{problem}{问题}[section]
\newtheorem{question}{问题}[section]

% 证明环境汉化
\renewcommand{\proofname}{\songfont\bfseries 证明}
\renewcommand{\qedsymbol}{\ensuremath{\blacksquare}}

% cleveref 中文配置
\crefname{theorem}{定理}{定理}
\crefname{definition}{定义}{定义}
\crefname{lemma}{引理}{引理}
\crefname{corollary}{推论}{推论}
\crefname{proposition}{命题}{命题}
\crefname{remark}{注}{注}
\crefname{example}{例}{例}
\crefname{problem}{问题}{问题}
\crefname{question}{问题}{问题}
\crefname{section}{节}{节}
\crefname{chapter}{章}{章}

% ---------- 6. 章节样式改造 ----------
% 本书以 \section 表示"章"(章 = 第 N 章, 与技能模板一致), 故将章级样式套用到 \section.
\newlength{\chapterNumSpace}
\setlength{\chapterNumSpace}{1.4cm}

% 附录状态开关: 供标题(Chapter/Appendix)与目录(第 N 章/附录 X)判断
\newif\ifInAppendix
\InAppendixfalse
\newif\ifInAppendixToc
\InAppendixTocfalse

% 章 = \section: 章号用纯数字(1,2,...), 节 = 章号.\arabic{subsection}.
% ctexbook 默认 \thesection = \thechapter.\arabic{section}; 因本书不使用 \chapter,
% \thechapter 恒为 0, 会得到 "0.N". 故此处改为纯章号.
\renewcommand{\thesection}{\arabic{section}}
\renewcommand{\thesubsection}{\thesection.\arabic{subsection}}
\renewcommand{\thesubsubsection}{\thesubsection.\arabic{subsubsection}}

% Part 样式
\assignpagestyle{\part}{empty}
\titleformat{\part}[display]
  {\normalfont\centering}
  {\vfill\fontsize{30pt}{30pt}\selectfont\bfseries\color{ThemeColor}\if@mainmatter \partname~\thepart \fi}
  {20pt}
  {\fontsize{45pt}{45pt}\selectfont\bfseries}
  [\vfill\clearpage]
\titlespacing*{\part}{0pt}{0pt}{0pt}

% 章级标题标签: Chapter/Appendix + 大号章号
\newcommand{\ChapterSectionLabel}{%
  \thispagestyle{plain}%
  \vspace*{-0.5cm}%
  \makebox[\textwidth][r]{%
    {\fontsize{18pt}{18pt}\selectfont\scshape
      \ifInAppendix Appendix\else Chapter\fi
    }\enspace
    {\fontsize{62pt}{62pt}\selectfont\bfseries\thesection}%
  }%
  \par\vspace{-0.25cm}%
  \noindent\rule{\dimexpr\textwidth-\chapterNumSpace\relax}{0.45pt}%
}

% 带编号章(= \section): 每章另起一页, 章号大号显示
\titleformat{\section}[display]
  {\normalfont}
  {\ChapterSectionLabel}
  {0cm}
  {\raggedleft\rightskip=\chapterNumSpace\fontsize{30pt}{35pt}\selectfont\bfseries}
  [\vspace{0.3cm}]
\newcommand{\sectionbreak}{\clearpage}
\titlespacing{\section}{0pt}{0pt}{0pt}
\ctexset{subsection={format=\large\bfseries}}

% 无编号章(= \section*, 如译者说明/前言/参考文献/术语索引)
\titleformat{name=\section,numberless}[block]
  {\normalfont\Large\bfseries\centering}
  {}
  {0pt}
  {}

% \chapter* 仅用于目录(ctexbook 的 \tableofcontents), 保持简洁章级标题
\titleformat{name=\chapter,numberless}[display]
  {\normalfont}
  {}
  {0pt}
  {\noindent\rule{\textwidth}{0.45pt}\vspace{0.5cm}
   \raggedleft\fontsize{28pt}{30pt}\selectfont\bfseries}
  [\vspace{1cm}]

% ---------- 7. 附录与目录编号 ----------
\newlength{\tocSectionLabelWidth}
\setlength{\tocSectionLabelWidth}{4.2em}
\newlength{\tocAppendixGap}
\setlength{\tocAppendixGap}{0.2em}
\newlength{\tocSubIndent}
\setlength{\tocSubIndent}{1.2em}
\newlength{\tocSubNumWidth}
\setlength{\tocSubNumWidth}{3.0em}

% 目录章号: 正文"第 N 章", 附录"附录 X"
\newcommand{\TocSectionNumber}[1]{%
  \ifInAppendixToc 附录\hspace{\tocAppendixGap}#1\else 第~#1~章\fi
}

% 目录中章(=\section)行样式: 加粗, 章号替换为"第 N 章"
\renewcommand*\l@section[2]{%
  \ifnum\c@tocdepth>\z@
    \addvspace{0.55em}%
    \begingroup
      \parindent\z@
      \rightskip\@pnumwidth
      \parfillskip-\@pnumwidth
      \leavevmode
      \bfseries
      \setlength{\@tempdima}{\tocSectionLabelWidth}%
      \advance\leftskip\@tempdima
      \hskip-\leftskip
      \def\numberline##1{\makebox[\@tempdima][l]{\TocSectionNumber{##1}}}%
      #1\nobreak\hfill\nobreak\makebox[\@pnumwidth][r]{#2}\par
    \endgroup
  \fi
}
\renewcommand*\l@subsection{\@dottedtocline{2}{\tocSubIndent}{\tocSubNumWidth}}

% 附录: 置位 \ifInAppendix, 并向目录写入"附录 X"起始标记
\let\originalappendix\appendix
\renewcommand{\appendix}{%
  \cleardoublepage
  \bookmarksetup{startatroot}%
  \originalappendix
  \InAppendixtrue
  % 附录章号改用字母(A,B,...), 并重置章内计数器
  \renewcommand{\thesection}{\Alph{section}}%
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \setcounter{subsubsection}{0}%
  \addtocontents{toc}{\protect\InAppendixToctrue}%
  \pdfbookmark[-1]{\appendixname}{appendix.root}%
}

% ---------- 8. 术语系统与参考文献 ----------
\newcommand{\MTTermList}{}
\newcommand{\addterm}[3]{%
  \g@addto@macro\MTTermList{#1 & #2 & #3 \\}%
}

% 术语记录机制: \newterm{key}{中文}{英文} 在正文首次出现处登记术语索引.
% 通过 aux 写出 \MTRegisterTerm, 由它收集到 \MTTermList 供 \printterminology 使用.
\newcommand{\MTTermRow}[3]{%
  {\termfont #1} & #2 & \hyperref[#3]{\pageref*{#3}} \\
}
\newcommand{\MTRegisterTerm}[3]{%
  \g@addto@macro\MTTermList{\MTTermRow{#1}{#2}{#3}}%
}
\newcommand{\termcn}[1]{{\termfont #1}}
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

\newcommand{\printterminology}{%
  \cleardoublepage
  \bookmarksetup{startatroot}
  \section*{术语索引}
  \addcontentsline{toc}{section}{术语索引}
  \markboth{术语索引}{术语索引}
  \vspace{0.5cm}
  \begin{longtable}{>{\raggedright\arraybackslash}p{0.3\textwidth}>{\raggedright\arraybackslash}p{0.5\textwidth}>{\centering\arraybackslash}p{0.1\textwidth}}
    \toprule \textbf{中文术语} & \textbf{英文术语} & \textbf{页码} \\ \midrule
    \endhead
    \MTTermList
    \bottomrule
  \end{longtable}
}

% 使用 patchcmd 安全注入参考文献逻辑
\AtBeginDocument{
  \@ifpackageloaded{biblatex}{}{%
    \patchcmd{\thebibliography}{\chapter*}{\cleardoublepage\bookmarksetup{startatroot}\chapter*}{}{}%
    \patchcmd{\thebibliography}{\@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}}{\markboth{\bibname}{\bibname}\addcontentsline{toc}{chapter}{\bibname}}{}{}%
  }
}

% ---------- 9. 封面生成 ----------
\newcommand{\makecover}{%
  \begin{titlepage}
    \thispagestyle{empty}\flushleft
    \rule{\textwidth}{1.2pt} \\[0.1cm]
    \rule{\textwidth}{0.8pt} \\[1.5cm]
    \hspace{1.5cm} \parbox{\dimexpr\textwidth-1.5cm}{
      {\fontsize{38pt}{46pt}\selectfont \bfseries \MT@BookTitleCN} \\[0.8cm]
      {\fontsize{20pt}{24pt}\selectfont \textit{\MT@BookTitleEN}}
    } \\[1.5cm]
    \rule{\textwidth}{0.6pt} \\[2cm]
    \hspace{1.5cm} {\Huge \textsc{\MT@OriginalAuthor}} \vfill
    \noindent
    \begin{minipage}[b]{0.45\textwidth}
        \raggedright
        \IfFileExists{logo.pdf}{%
            \includegraphics[width=5cm]{logo.pdf}
        }{%
            \framebox[5cm][c]{\rule{0pt}{1.2cm}LOGO}
        }
    \end{minipage}%
    \hfill
    \begin{minipage}[b]{0.50\textwidth}
        \raggedleft
        {\small \MT@OriginalEdition · \MT@OriginalPublisher · \MT@OriginalYear} \\[2pt]
        {\small Translated by \MT@Translator} \\[2pt]
        \ifdefempty{\MT@ModelUsed}{}{{\small Model: \MT@ModelUsed} \\[2pt]}
        {\small Updated: \ifdefempty{\MT@TranslationDate}{\today}{\MT@TranslationDate}}
    \end{minipage}
    \vspace*{0.5cm}
  \end{titlepage}
}

\endinput