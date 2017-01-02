\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{techtex}[2016/12/31 Tech-Tex]

%% Custom options
%  font size
\DeclareOption{12pt}{
     \PassOptionsToClass{\CurrentOption}{article}
}

%  font families
\DeclareOption{roman}{
     \renewcommand*\sfdefault{ptm} % Times
     \renewcommand{\familydefault}{\rmdefault}
}

\DeclareOption{sansserif}{
     \renewcommand*\sfdefault{phv} % Helvetica
     \renewcommand{\familydefault}{\sfdefault}
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

%% Default options
\ExecuteOptions{12pt}

%% Execute given options
\ProcessOptions\relax

%% Load basic class
\LoadClass[a4paper]{article}

%% Needed packages
\RequirePackage{fancyhdr} % for the customizations of footers
\pagestyle{fancy}

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

%  page numbering on the right
\fancyhf{}                         % clear header and footer content
\renewcommand{\headrulewidth}{0pt} % gets rid of the stupid rule on header
\fancyfootoffset{0pt}              % grant number on the far right
\fancyfoot[R]{\thepage}            % print page number on the right

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
     \addcontentsline{toc}{subsection}
          {\numberline{\thetsecounter.\thetsubsecounter} #1}
     \subsection*{#1}
}

%  subsubsections
%　this is the last level
\newcounter{tssubsecounter}[tsubsecounter]
\newcommand{\tsubsubsection}[1]{
     \refstepcounter{tssubsecounter}
     \addcontentsline{toc}{subsubsection}
          {\numberline{\thetsecounter.\thetsubsecounter.\thetssubsecounter} #1}
     \subsubsection*{#1}
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
\renewcommand{\maketitle}{
     \vspace{-1,5cm}
     {\LARGE \raggedright\@title}\par\noindent
     \vskip .5cm\par\noindent
     {\centering \normalsize \@date \par}
     \vskip .8cm
     \global\let\@title\@empty
}

\endinput
