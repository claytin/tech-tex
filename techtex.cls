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

%  seting babel based on language option
\if@brazil
     \RequirePackage[brazil]{babel}
\fi

\if@german
     \RequirePackage[ngerman]{babel}
\fi

\endinput
