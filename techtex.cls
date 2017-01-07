\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{techtex}[2016/12/31 v.00 Tech-Tex]

%% Custom options
%  font size
\DeclareOption{12pt}{
     \PassOptionsToClass{\CurrentOption}{article}
}

\DeclareOption{11pt}{
     \PassOptionsToClass{\CurrentOption}{article}
}

%  default font
\DeclareOption{roman}{
     \renewcommand*\sfdefault{ptm} % Times
     \renewcommand{\familydefault}{\rmdefault}
}

\newif\if@sansserif\@sansseriffalse
\DeclareOption{sansserif}{
     \@sansseriftrue
}

%  languages
\newif\if@brazil\@brazilfalse
\DeclareOption{brazil}{
     \@braziltrue
     \PassOptionsToClass{\CurrentOption}{article}
}

\newif\if@german\@germanfalse
\DeclareOption{german}{
     \@germantrue
     \PassOptionsToClass{\CurrentOption}{article}
}

%% Execute given options
\ProcessOptions\relax

%% Load basic class
\LoadClass[a4paper]{article}

%% Needed packages
%  customizations of footers
\RequirePackage{fancyhdr}
\pagestyle{fancy}

%  toc customization
%  the titles option helps the compatibility with fancyhdr package
\RequirePackage{tocstyle}
\usetocstyle{standard}
\RequirePackage[titles]{tocloft}

%  font shenanigans
%  dunno
\RequirePackage[T1]{fontenc}

%  if sansserif is set as default font family
\if@sansserif
     \RequirePackage[default]{opensans}
\fi

%  set AnonymousPro as ttdefault font
\RequirePackage[ttdefault=true]{AnonymousPro}

%% Language shenanigans
%  setting babel based on language option
\if@brazil
     \RequirePackage[brazil]{babel}
\fi

\if@german
     \RequirePackage[ngerman]{babel}
\fi

%% Document layout
%  margins
\RequirePackage[left=30mm,
                top=30mm,
                right=25mm,
                bottom=25mm]{geometry}

%  page numbering on the bottom right
\fancyhf{}                         % clear header and footer content
\renewcommand{\headrulewidth}{0pt} % gets rid of the stupid rule on header
\fancyfootoffset{0pt}              % grant number on the far right
\fancyfoot[R]{\thepage}            % print page number where it should

%  toc changes
%  no title on toc
\addto\captionsenglish{\renewcommand{\contentsname}{}}
\addto\captionsbrazil{\renewcommand{\contentsname}{}}
\addto\captionsngerman{\renewcommand{\contentsname}{}}

\renewcommand{\tableofcontents}{
     \vspace{-0.5cm}
     \@starttoc{toc}
}

%  no page numbers after sections
\addtocontents{toc}{\cftpagenumbersoff{sec}}

%  page numbers right after ?section names; the leader commands also grant no
%  doted lines
\renewcommand{\cftsecleader}{}
%\renewcommand{\cftsubsecleader}{}
%\renewcommand{\cftsubsubsecleader}{}
%\renewcommand{\cftsecafterpnum}{\cftparfillskip}
%\renewcommand{\cftsubsecafterpnum}{\cftparfillskip}
%\renewcommand{\cftsubsubsecafterpnum}{\cftparfillskip}
%\renewcommand{\cftpnumalign}{r}

%  diferent font for page numbers
%\renewcommand{\cftsubsecpagefont}{\ttfamily}
%\renewcommand{\cftsubsubsecpagefont}{\ttfamily}

%% Custom commands
%  creates an unnumbered section and add it to the TOC;
%  the section title is followed by a line
\newcounter{tsecounter}
\newcommand{\tsection}[1]{
     \refstepcounter{tsecounter}
     \addcontentsline{toc}{section}{\numberline{\thetsecounter} #1}
     \section*{#1\\[-5mm]\rule{\textwidth}{.4pt}}
}

%  unnumbered subsections
\newcounter{tsubsecounter}[tsecounter]
\newcommand{\tsubsection}[1]{
     \refstepcounter{tsubsecounter}
     \subsection*{#1}
     \addcontentsline{toc}{subsection}
          {\numberline{\thetsecounter.\thetsubsecounter} #1}
}

%  subsubsections
%　this is the last level
\newcounter{tssubsecounter}[tsubsecounter]
\newcommand{\tsubsubsection}[1]{
     \refstepcounter{tssubsecounter}
     \subsubsection*{#1}
     \addcontentsline{toc}{subsubsection}
          {\numberline{\thetsecounter.\thetsubsecounter.\thetssubsecounter} #1}
}

%  new environment, description
\newenvironment{tdescription}
     {\noindent%
      \centering
      \begin{minipage}{.8\textwidth}%
           \small}
     {\end{minipage}%
      \par\noindent%
      \ignorespacesafterend}

%  command correspondent to the tdescription environment
\newcommand{\tdesc}[1]{
     \begin{tdescription}#1\end{tdescription}
}

%% Redefinitions
%  stop wasting space before doc title, and some stylish changes
%  it's just a huge simplificantion
\renewcommand{\maketitle}{
     \vspace{-1,5cm}
     {\LARGE \raggedright\@title}\par\noindent
     \vskip .5cm\par\noindent
     {\centering \normalsize \@date \par}
     \vskip .8cm
     \global\let\@title\@empty
}

\endinput
