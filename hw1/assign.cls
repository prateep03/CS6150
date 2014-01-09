%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DO NOT MAKE ANY CHANGES TO THIS DOCUMENT!
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%%% Scribing Document Class
%%%
%%% This document class is much like the article class.
%%% These are the preamble commands provided by this document class:
%%%
%%%     \lecturenumber{number}  % sequence number
%%%     \lecturetitle{title}    % title describing lecture topic
%%%     \lecturedate{date}      % date on which lecture was delivered
%%%     \lecturescribe{name}    % name of individual scribing lecture
%%%
%%% The class also provides a number of new theorems, commands, and
%%% environments, including:
%%%
%%%     \urlclick{url}
%%%     \figureadd{basename}{label}{caption}
%%%     \figureaddnostretch{basename}{label}{caption}
%%%

\ProvidesClass{scribing}
\LoadClass{article}
\usepackage{float}
%-------------------------------------------------------------------
\newif\ifpdf
\ifx\pdfoutput\undefined
    \pdffalse           % we are not running PDFLaTeX
\else
    \pdfoutput=1        % we are running PDFLaTeX
    \pdftrue
\fi
%-------------------------------------------------------------------
\ifpdf
    \usepackage[pdftex,
        colorlinks=true,
        urlcolor=rltblue,                % \href{...}{...}
        filecolor=rltgreen,              % \href*{...}
        linkcolor=rltred,                % \ref{...} and \pageref{...}
        citecolor=rltbrightgreen,        % \cite{...}
        anchorcolor=rltbrightblue,       % ???
        menucolor=rltdarkblue,           % ??? 
        pdftitle={CS 5150/6150 Lecture Notes},
        pdfauthor={Suresh Venkatasubramanian,  University of Utah},
        pdfsubject={Computational Geometry},
        pdfkeywords={algorithms computational geometry  course lecture notes education},
%        pagebackref,
        pdfpagemode=None,
        bookmarksopen=true]{hyperref}
    \pdfcompresslevel=9
    \usepackage[pdftex]{graphicx}
    \usepackage{thumbpdf}
\else
    \usepackage[
        colorlinks=true,
        urlcolor=rltblue,                % \href{...}{...}
        filecolor=rltgreen,              % \href*{...}
        linkcolor=rltred,                % \ref{...} and \pageref{...}
        citecolor=rltbrightgreen,        % \cite{...}
        anchorcolor=rltbrightblue,       % ???
        menucolor=rltdarkblue]{hyperref} % ???
    \usepackage[dvips]{graphicx}
\fi
%-------------------------------------------------------------------
\usepackage{color}
\definecolor{rltbrightred}{rgb}{1,0,0}
\definecolor{rltred}{rgb}{0.75,0,0}
\definecolor{rltdarkred}{rgb}{0.5,0,0}
%
\definecolor{rltbrightgreen}{rgb}{0,0.75,0}
\definecolor{rltgreen}{rgb}{0,0.5,0}
\definecolor{rltdarkgreen}{rgb}{0,0,0.25}
%
\definecolor{rltbrightblue}{rgb}{0,0,1}
\definecolor{rltblue}{rgb}{0,0,0.75}
\definecolor{rltdarkblue}{rgb}{0,0,0.5}
%-------------------------------------------------------------------
\usepackage{amsmath,amssymb,amsthm,algorithm,algorithmic}
\textwidth=6in
\oddsidemargin=0.25in
\evensidemargin=0.25in
\topmargin=-0.1in
\footskip=0.8in
\parindent=0.0cm
\parskip=0.3cm
\textheight=8.00in
\setcounter{tocdepth}{3}
\setcounter{secnumdepth}{2}
\sloppy

\newcommand{\coname}{CS 5150/6150: Graduate Algorithms}
\newcommand{\coursename}[1]{%
  \renewcommand{\coname}{#1}
}

\newcommand{\lecturenumber}[1]{%
  \newcommand{\lecnumber}{#1}
}

\newcommand{\lecturetitle}[1]{%
  \newcommand{\lectitle}{#1}
}

\newcommand{\lecturedate}[1]{%
  \newcommand{\lecdate}{#1}
}

\newcommand{\duedate}[1]{%
  \newcommand{\subdate}{#1}
}

\newcommand{\lecturescribe}[1]{%
  \newcommand{\lecscribe}{#1}
}

\newcommand{\urlclick}[1]{\href{#1}{\emph{#1}}}

\newcommand{\figureadd}[3]{%
  \begin{figure}[ht]
    \begin{center}
      \includegraphics[width=\textwidth]{#1}
      \caption{#3}
      \label{#2}
    \end{center}
  \end{figure}
}

\newcommand{\figureaddnostretch}[3]{%
  \begin{figure}[ht]
    \begin{center}
      \includegraphics{#1}
      \caption{#3}
      \label{#2}
    \end{center}
  \end{figure}
}

\theoremstyle{plain}
\newtheorem{theorem}{Theorem}
\newtheorem{corollary}{Corollary}
\newtheorem{lemma}{Lemma}[section]
\newtheorem{claim}{Claim}
\newtheorem{fact}{Fact}
\newtheorem{definition}{Definition}
\newtheorem{assumption}{Assumption}
\newtheorem{observation}{Observation}
\newtheorem{example}{Example}
\numberwithin{equation}{section}

%\newcommand{\qed}{\rule{7pt}{7pt}}
% \newenvironment{proof}{\noindent{\bf Proof:}}{\qed\bigskip}
\newenvironment{proof_sketch}{\noindent{\bf Sketch of Proof}\hspace*{1em}}{\qed\bigskip}

\renewcommand{\thepage}{\lecnumber-\arabic{page}}
\renewcommand{\thesection}{\lecnumber.\arabic{section}}
\renewcommand{\theequation}{\lecnumber.\arabic{equation}}
\renewcommand{\thefigure}{\lecnumber.\arabic{figure}}
\renewcommand{\thetable}{\lecnumber.\arabic{table}}

\pagestyle{myheadings}
\thispagestyle{plain}
\setcounter{page}{1}

\AtBeginDocument{%
  \begin{center}
    \framebox{%
      \vbox{%
	\textbf{\coname \hfill \lecdate}\\
	\vspace{1.2em}
        \textbf{\Large \lectitle \lecnumber}\\
%        \vspace{1em}
	\textsl{DUE DATE: \subdate}\\
	\vspace{1em}
      }
    }
  \end{center}
  \vspace*{4mm}
  \markboth{\lectitle \lecnumber: \lecdate}{\lectitle \lecnumber: \lecdate}
  \noindent
}

\def\etal{\emph{et al.}}