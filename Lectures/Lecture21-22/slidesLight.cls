\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{slidesLight}

\LoadClass[14pt, aspectratio=169, t]{beamer}
\usetheme{default}

% Increase font size of institute
\setbeamerfont{institute}{size=\normalsize}

% misc
\newcommand{\heart}{\large\color{RubineRed}{\ensuremath\heartsuit}}

% Spacing
\usepackage{setspace}
\setstretch{1}

% Misc Packages
\RequirePackage{comment}
\RequirePackage{changepage}

% Figures/Graphics
\RequirePackage{morefloats}
\RequirePackage{graphicx}
\RequirePackage{caption}
\RequirePackage{subcaption}

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

% Colors
\definecolor{red}{RGB}{175 , 0 , 0}
\definecolor{blue}{RGB}{0 , 0, 175}
\definecolor{green}{RGB}{75, 150 ,0}
\definecolor{purple}{RGB}{108, 0 ,108}
\definecolor{grey}{RGB}{225 , 225 ,225}
\definecolor{dgrey}{RGB}{125 , 125 ,125}
\definecolor{ddgrey}{RGB}{60 , 60 ,60}
\definecolor{midgrey}{RGB}{100 , 100 ,100}
\definecolor{bgcolor}{RGB}{255 , 255 , 255}
\definecolor{maroon}{RGB}{0.5, 0.0, 0.0}


% Text Color Macros
\newcommand{\blue}{\textcolor{blue}}
\newcommand{\red}{\textcolor{red}}
\newcommand{\green}{\textcolor{green}}
\newcommand{\purple}{\textcolor{purple}}
\newcommand{\ddgrey}{\textcolor{ddgrey}}

% Margins
\setbeamersize{text margin left=2em, text margin right=2em} 
\addtolength{\headsep}{0.25cm}
\setbeamertemplate{frametitle}{
    \insertframetitle \\ \vspace{0.1em}
}

% Footer
\setbeamertemplate{navigation symbols}{}
\setbeamertemplate{footline}{\hspace{14cm}\footnotesize \insertframenumber{} / \inserttotalframenumber \vspace{1em}}

% Section page
\AtBeginSection[]{
  \begin{frame}
  \vfill
  \centering
  \begin{beamercolorbox}[center, sep=6em]{title}
    \usebeamerfont{title}{\insertsectionhead}\par%
  \end{beamercolorbox}
  \vfill
  \end{frame}
}

% Itemize
\newenvironment{witemize}{\itemize\addtolength{\itemsep}{10pt}}{\enditemize}
\newenvironment{mitemize}{\vspace{1pt}\itemize\addtolength{\itemsep}{5pt}}{\enditemize}
\setbeamertemplate{itemize items}[circle]
\setbeamertemplate{itemize subitems}[circle]
\newenvironment{wenumerate}{\enumerate\addtolength{\itemsep}{10pt}}{\endenumerate}

% Setting Colors
\setbeamercolor{normal text}{fg=black}
\setbeamercolor{title}{fg=purple}
\setbeamercolor{frametitle}{fg=purple}
\setbeamercolor{structure}{fg=black}
%\setbeamercolor{author}{fg=red}
%\setbeamercolor{institute}{fg=blue}
\setbeamercolor{alerted text}{fg=red}
\setbeamercolor{background canvas}{bg=bgcolor}
\setbeamercolor{button}{fg=ddgrey, bg=grey}

% Custom Definitions
\newcommand{\E}{\index{Expected Value}\text{$\mathbb{E}$\kern.3pt}}
\newcommand{\I}{\index{Indicator Function}\text{$\mathbb{I}$\kern.3pt}}


