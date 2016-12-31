\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{techtex}[2016/12/31 Tech-Tex]

%% Custom options
%  font size
\DeclareOption{12pt}{
     \PassOptionsToClass{\CurrentOption}{book}
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

%% Default options
\ExecuteOptions{12pt}

%% Execute given options
\ProcessOptions\relax

%% Load basic class
\LoadClass[a4paper]{book}

\endinput
