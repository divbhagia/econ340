\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{div_slides}

\LoadClass[14pt, aspectratio=169, t]{beamer}
\usetheme{default}

% Colors
\definecolor{red}{RGB}{175 , 0 , 0}
\definecolor{orange}{RGB}{240 , 70 , 35}
\definecolor{blue}{RGB}{0 , 0, 175}
\definecolor{green}{RGB}{75, 150 ,0}
\definecolor{purple}{RGB}{108, 0 ,108}
\definecolor{grey}{RGB}{225 , 225 ,225}
\definecolor{dgrey}{RGB}{125 , 125 ,125}
\definecolor{ddgrey}{RGB}{60 , 60 ,60}
\definecolor{midgrey}{RGB}{100 , 100 ,100}
\definecolor{bgcolor}{RGB}{255 , 255 , 255}
\definecolor{maroon}{RGB}{0.5, 0.0, 0.0}

% Pick theme color from the above
\definecolor{themecolor}{RGB}{108, 0 ,108}

% Misc Packages
\RequirePackage{comment}
\RequirePackage{changepage}
\RequirePackage{animate}
\RequirePackage{pgfplots}
\RequirePackage{pgfplotstable}
\RequirePackage{multicol}
\RequirePackage{tikzsymbols}
\RequirePackage{setspace}

% R Code
\RequirePackage{listings}
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

% Figures/Graphics
\RequirePackage{morefloats}
\RequirePackage{graphicx}
\RequirePackage{caption}
%\RequirePackage{subcaption}
\RequirePackage{subfig}

% Fonts & Text
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[english]{babel}
\RequirePackage[default]{lato}
\RequirePackage[charter]{mathdesign}

% Math
\RequirePackage{amsthm}
\RequirePackage{amsmath} 
\RequirePackage{amsfonts}
\RequirePackage{mathabx}
\RequirePackage{exscale, relsize}

% Tables and Graphics
\RequirePackage[scr]{rsfso}
\RequirePackage{tabularx}
\RequirePackage{booktabs}
\RequirePackage{graphicx}
\RequirePackage{dcolumn}
\RequirePackage{tikz}
\RequirePackage{tikzsymbols}
\usetikzlibrary{positioning,calc,matrix,shapes.multipart,backgrounds,arrows}
\RequirePackage{xsavebox}
\newcolumntype{P}[1]{>{\centering\arraybackslash}p{#1}}
\newcolumntype{Y}{>{\centering\arraybackslash}X}


% Text Color Macros
\newcommand{\blue}{\textcolor{blue}}
\newcommand{\red}{\textcolor{red}}
\newcommand{\green}{\textcolor{green}}
\newcommand{\purple}{\textcolor{purple}}
\newcommand{\ddgrey}{\textcolor{ddgrey}}
\newcommand{\orange}{\textcolor{orange}}
\newcommand{\themecolor}{\textcolor{themecolor}}

% Links
\hypersetup{colorlinks, urlcolor=blue}

% Theorems & Assumptions
\setbeamertemplate{blocks}[rounded][shadow=false]
\makeatletter
\def\th@mystyle{%
\normalfont 
\setbeamercolor{block title example}{bg=ddgrey,fg=bgcolor}
\setbeamercolor{block body example}{bg=grey!20, fg=ddgrey}
\def\inserttheoremblockenv{exampleblock}
}
\makeatother
\theoremstyle{plain}
\theoremstyle{mystyle}
\setbeamertemplate{theorems}[numbered]
\newtheorem{assump}{Assumption}
\newtheorem{prop}{Proposition}
\newtheorem{corr}{Corollary}

% Margins
\setbeamersize{text margin left=2em, text margin right=2em} 
\addtolength{\headsep}{0.25cm}
\setbeamertemplate{frametitle}{
    \insertframetitle \\ \vspace{0.1em}
}

% Footer
\setbeamertemplate{navigation symbols}{}
\setbeamertemplate{footline}{\hspace{14cm}\footnotesize \insertframenumber{} / \inserttotalframenumber \vspace{1em}}

% Itemize
\newenvironment{witemize}{\itemize\addtolength{\itemsep}{10pt}}{\enditemize}
\newenvironment{wenumerate}{\enumerate\addtolength{\itemsep}{10pt}}{\endenumerate}
\newenvironment{mitemize}{\vspace{1pt}\itemize\addtolength{\itemsep}{5pt}}{\enditemize}
\setbeamertemplate{itemize items}[circle]
\setbeamertemplate{itemize subitems}[circle]

% Setting Colors
\setbeamercolor{normal text}{fg=black}
\setbeamercolor{title}{fg=themecolor}
\setbeamercolor{frametitle}{fg=themecolor}
\setbeamercolor{structure}{fg=black}
%\setbeamercolor{author}{fg=red}
%\setbeamercolor{institute}{fg=blue}
\setbeamercolor{alerted text}{fg=red}
\setbeamercolor{background canvas}{bg=bgcolor}
\setbeamercolor{button}{fg=ddgrey, bg=grey}

% Section page
\AtBeginSubsection[]{
  \begin{frame}
  \purple
  \vfill
  \centering
  \begin{beamercolorbox}[center, sep=6em]{text}
    \usebeamerfont{title}{\insertsectionhead \vspace{0.25em}}\par%
    \usebeamerfont{title}{\Large \insertsubsectionhead}\par%
  \end{beamercolorbox}
  \vfill
  \end{frame}
}

% Tikz Symbols
%\tikzstyle{arrow} = [thick,->,>=stealth]
\tikzstyle{box} = [rectangle, rounded corners, minimum width=1cm, minimum height=1cm,text centered, draw=black, fill=dgrey, fill opacity=0.1, text opacity=1]
\tikzstyle{boxW} = [rectangle, rounded corners, text centered, draw=black]
\tikzstyle{boxd} = [rectangle, thick, rounded corners, text centered, draw=red]
\tikzstyle{box1} = [rectangle, thick, rounded corners, minimum width=1cm, minimum height=1cm,text centered, draw=red, fill=red, fill opacity=0.02, text opacity=1]
\tikzstyle{box2} = [rectangle, thick, rounded corners, minimum width=1cm, minimum height=1cm,text centered, draw=blue, fill=blue, fill opacity=0.02, text opacity=1]

% Custom Definitions
\newcommand{\E}{\index{Expected Value}\text{$\mathbb{E}$\kern.3pt}}
\newcommand{\I}{\index{Indicator Function}\text{$\mathbb{I}$\kern.3pt}}

% Appendix Numbering
\newcommand{\backupbegin}{
   \newcounter{framenumberappendix}
   \setcounter{framenumberappendix}{\value{framenumber}}
   \addtocounter{framenumber}{-\value{framenumber}}
   \setbeamertemplate{footline}{\hspace{13.25cm}APPENDIX \hspace{0.25em} SLIDE \hspace{0.25em}  \insertframenumber{} \vspace{0.4em}}
}
\newcommand{\backupend}{
   \addtocounter{framenumberappendix}{-\value{framenumber}}
   \addtocounter{framenumber}{\value{framenumberappendix}} 
}

% Custom Definitions
\pgfmathdeclarefunction{gauss}{2}{%
  \pgfmathparse{1/(#2*sqrt(2*pi))*exp(-((x-#1)^2)/(2*#2^2))}%
}


% For DAGs in Latex
\usetikzlibrary{shapes,decorations,arrows,calc,arrows.meta,fit,positioning}
%\tikzset{
%    -Latex,auto,node distance =1 cm and 1 cm,semithick,
%    state/.style ={ellipse, draw, minimum width = 0.7 cm},
%    point/.style = {circle, draw, inner sep=0.04cm,fill,node contents={}},
%    bidirected/.style={Latex-Latex,dashed},
%    el/.style = {inner sep=2pt, align=left, sloped}
%}

