\ProvidesClass{div}
\LoadClass[12pt]{article}

\RequirePackage[english]{babel}
\RequirePackage[utf8x]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{listings}
\RequirePackage{amssymb}
\RequirePackage{amsfonts}
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{latexsym}
\RequirePackage{epsfig}
\RequirePackage{bm}
\RequirePackage{xspace}
\RequirePackage{tgbonum}
\RequirePackage{amsfonts,epsfig}
\RequirePackage{fancyhdr}
\RequirePackage{pgf,tikz}
\pagestyle{fancy}
\RequirePackage{relsize}
\RequirePackage{venndiagram}
\RequirePackage{setspace}
\RequirePackage{comment}
\RequirePackage{subfig}
\RequirePackage{xsavebox}
\RequirePackage{tikzsymbols}
\usetikzlibrary{positioning,calc,matrix,shapes.multipart,backgrounds,arrows}
\RequirePackage{pgfplotstable}
\RequirePackage{hyperref}

% R Code
\RequirePackage{listings}
\RequirePackage{beramono}
\lstset{language=R,
  basicstyle=\ttfamily\small, % the font size and style for your code
  keywordstyle=\color{blue}, % color for keywords
  commentstyle=\color{gray}, % color for comments
  stringstyle=\color{green}, % color for strings
  breaklines=true, % enable line breaks
  showstringspaces=false, % hide spaces in strings
  numbers=left, % show line numbers on the left
  numberstyle=\tiny, % font size for line numbers
  frame=single, % add a border around the code
  backgroundcolor=\color{white}, % set the background color
}

% Sections & Subsections
\RequirePackage{sectsty}
\renewcommand{\thesection}{\arabic{section}} 
\renewcommand{\thesubsection}{\arabic{section}.\arabic{subsection}} 
  \sectionfont{\large \normalfont \sc}
\subsectionfont{\fontsize{13}{1} \normalfont \textit}
\subsubsectionfont{\fontsize{12}{1} \normalfont \textit}

% Spacing and Margins
\RequirePackage[margin=1.15in]{geometry} 
\setlength{\parindent}{0em}
\setlength\parskip{1em}

% Tables
\RequirePackage{booktabs}
\RequirePackage{tabularx}

% For DAGs in Latex
\usetikzlibrary{shapes,decorations,arrows,calc,arrows.meta,fit,positioning}
\tikzset{
    -Latex,auto,node distance =1 cm and 1 cm,semithick,
    state/.style ={ellipse, draw, minimum width = 0.7 cm},
    point/.style = {circle, draw, inner sep=0.04cm,fill,node contents={}},
    bidirected/.style={Latex-Latex,dashed},
    el/.style = {inner sep=2pt, align=left, sloped}
}

% Itemize
\newenvironment{witemize}{\itemize\addtolength{\itemsep}{10pt}}{\enditemize}
\newenvironment{mitemize}{\vspace{1pt}\itemize\addtolength{\itemsep}{5pt}}{\enditemize}
\newenvironment{wenumerate}{\enumerate\addtolength{\itemsep}{10pt}}{\endenumerate}

% Custom Definitions
\pgfmathdeclarefunction{gauss}{2}{%
  \pgfmathparse{1/(#2*sqrt(2*pi))*exp(-((x-#1)^2)/(2*#2^2))}%
}
\newcolumntype{P}[1]{>{\centering\arraybackslash}p{#1}}
\newcolumntype{Y}{>{\centering\arraybackslash}X}
