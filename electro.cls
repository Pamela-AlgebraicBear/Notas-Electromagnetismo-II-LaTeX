\ProvidesClass{electro}[2023/11/15 v1.0 Clase para notas de electromagnetismo]

% --- Configuración básica ---

\LoadClass[10pt, letterpaper, twoside]{article} %AQUI SE BORRO twocolumn

% Configuración de idioma
\usepackage[utf8]{inputenc}
\RequirePackage[english, spanish, mexico, es-noitemize, es-noindentfirst]{babel}

% Matemáticas avanzadas
\RequirePackage[tbtags]{mathtools}% Funciones matemáticas avanzadas (carga amsmath internamente)
\RequirePackage{amssymb, amsmath, amsthm, siunitx}% Funciones matemáticas adicionales y unidades del SI
\RequirePackage[nolimits]{cmupint}% Integrales rectas

% Configuración de fuente
\RequirePackage{lmodern}
\RequirePackage[T1]{fontenc}
\renewcommand{\ttdefault}{lmtt}% Fuente mono
\renewcommand{\rmdefault}{lmr}% Fuente serif
\renewcommand{\sfdefault}{lmss}% Fuente sans-serif

% Diseño del documento
\RequirePackage[margin=1in, headheight=2\baselineskip, headsep=\baselineskip]{geometry} %AQUI BORRE TWOCOLUMN
\RequirePackage[pdfusetitle, colorlinks]{hyperref}
\RequirePackage[shortlabels, inline]{enumitem}
\RequirePackage[titles]{tocloft}
\RequirePackage{fancyhdr, tabularray, titlesec, apptools, abstract, xcolor, xpatch, calc, etoolbox, abstract}

% Gráficos
\RequirePackage{graphicx, pdfpages, pdflscape, pgfplots, tcolorbox, graphbox}
\RequirePackage[outline]{contour}
\RequirePackage[hang, labelfont=bf, labelsep=period, margin=0.5in]{caption}
\RequirePackage{subcaption}

% Bibliografía
\RequirePackage[backend=biber]{biblatex}
\RequirePackage[style=mexican]{csquotes}

% --- Configuraciones adicionales de paquetes ---

% Versión de PGFplots
\pgfplotsset{compat=newest}

% Librerías de pgfplots
\usepgfplotslibrary{colormaps}

% Librerías de tikz
\usetikzlibrary{babel, calc, scopes, intersections, angles, quotes, arrows, arrows.meta, backgrounds, shapes.geometric, patterns, shadows, perspective, external}

% Definición de estilos de Tikz, etc.
\tikzset{%
	% Configuraciones de tikz particulares del documento, como estilos de nodos y dibujos
	font = {\selectfont},
	frame/.style={thin, dashed, lightgray, line cap=round, rounded corners=5pt}
}

% Grosor de contorno adicional (para emplearse en gráficos)
\contourlength{1pt}

% Directorios de gráficos
\graphicspath{{imágenes/}{escudos/}}

% Todos los enlaces del documento en negro
\hypersetup{allcolors=black}

% Librerías de tabularray
\UseTblrLibrary{booktabs}
\UseTblrLibrary{amsmath}

% --- Configuraciones adicionales de diseño ---

% C-O-L-O-R-E-S--
% Colores
\definecolor{principaluno}{HTML}{003D64}% Azul oscuro
\definecolor{principaldos}{HTML}{EAEDEF}% Gris claro
\definecolor{secuno}{HTML}{0897D5}% Azul claro
\definecolor{secdos}{HTML}{E8442A}% Naranja
\definecolor{sectres}{HTML}{7F9297}% Gris oscuro
\definecolor{seccuatro}{HTML}{F6F7F7}% Casi blanco

%\definecolor{principaluno}{rgb}{0.145,0.247,0.294} %Azul grisáceo (Titulos)
%\definecolor{principaldos}{rgb}{0.557,0.694,0.761} % azul claro (Fondo/colorbox)
%\definecolor{principaluno} % (Definicion) (USAR AL !60 DE INTENSIDAD)
%\definecolor{secdos}{HTML}{7B5037} % Old Copper (Teorema)(USAR AL !60 DE INTENSIDAD)
%\definecolor{sectres}{HTML}{9D8161} % Pale Brown (Lema) (USAR AL !60 DE INTENSIDAD)
%\definecolor{seccuatro}{HTML}{C1B59F} % Bison Hide (Corolario)
%\definecolor{secinc}{HTML}{969286} % Pale Oyster (Ejercicio)
%\definecolor{seis}{rgb}{142,177,194} %(Observaciones) (USARL AL !40 DE INTENSIDAD)

% Comandos personalizados 

    % Divergencia
    \newcommand{\Div}{\nabla \cdot}

    % Rotacional
    \newcommand{\rot}{\nabla \times }
    
    % Derivada parcial de primer orden
    \newcommand{\dpuno}[2]{\frac{\partial #1}{\partial #2}}
    
    %Reales y Naturales
    \newcommand{\R}{\mathbb{R}} % Define \R para los reales
    \newcommand{\N}{\mathbb{N}} % Define \N para los naturales
    
    %Normas
    \newcommand{\norm}[1]{\lVert #1 \rVert}
    
% Diseño de títulos de sección
\titleformat{\section}
{\centering\normalfont\Large\bfseries}{\thesection.}{1ex}{\color{principaluno}}

\titleformat{\subsection}
{\normalfont\large\bfseries}{\thesubsection.}{1ex}{\color{principaluno}}

\titleformat{\subsubsection}
{\normalsize\bfseries}{\thetitle.}{\widthof{\enspace}}{\normalsize\color{principaluno}}

\AtAppendix{%
    \titleformat{\section}[block]
    {\centering\normalfont\Large\bfseries}{\appendixname\ \thesection.}{1ex}{\color{principaluno}}
}

% Tokens para llenar el documento
\newtoks\subtitle
\newtoks\subject
\newtoks\email


% --- Página de título de documento ---
\makeatletter
	\renewcommand\maketitle{%

    	\renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    	\def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    	\long\def\@makefntext##1{\parindent 1em\noindent
    			\hb@xt@1.8em{%
    			  \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    
        \begin{center}%
    		\begin{tblr}{colspec={Q[c, b, wd=.15\textwidth] Q[c, b, wd=.6\textwidth] Q[c, b, wd=.15\textwidth]}}
    			\includegraphics[width=.15\textwidth]{imágenes/escudos/unam.png}
    			& {\bfseries\large\textcolor{principaluno}{\@title} \\ \LARGE\the\subtitle}
    			& \includegraphics[width=.15\textwidth]{imágenes/escudos/fcunam.png}
    		\end{tblr}
    		
    		\medskip
   
    % --- Opción para dos autores ---
    
             \begin{tabular}{c@{\hspace{3em}}c}
                 Jonathan Alexis Urrutia Anguiano\thanks{Autor de las notas originales} & Pamela Sánchez Canales\thanks{Adaptación y desarrollo en LaTeX} \\ 
                 \href{mailto:jaurrutia.95@ciencias.unam.mx}{\footnotesize\color{principaluno}\texttt{jaurrutia.95@ciencias.unam.mx}} & \href{mailto:pamela.sanchez@ciencias.unam.mx}{\footnotesize\color{principaluno}\texttt{pamela.sanchez@ciencias.unam.mx}}
            \end{tabular}
    % --- Opción para tres autores ---

    %         \begin{tabular}{c@{\hspace{3em}}c@{\hspace{3em}}c}
    %             Nombre del autor 1\thanks{Información adicional del primer autor.} & Nombre del autor 2\thanks{Información adicional del segundo autor.} & Nombre del autor 3\thanks{Información adicional del tercer autor.} \\ 
    %            \href{mailto:emailautor1@email.com}{\footnotesize\color{principaluno}\texttt{emailautor1@email.com}} & \href{mailto:emailautor2@email.com}{\footnotesize\color{principaluno}\texttt{emailautor2@email.com}} & \href{mailto:emailautor3@email.com}{\footnotesize\color{principaluno}\texttt{emailautor3@email.com}}
    %         \end{tabular}
    
    		\medskip
    		
    		Facultad de Ciencias\\
    		Universidad Nacional Autónoma de México
    		
    		\medskip
    		
    		\textit{Última actualización
      : \@date\\[1ex]}
    
        \end{center}
    
        \thispagestyle{plain}
    
    	\medskip
	}
\makeatother

% Rediseño del estilo plain
\fancypagestyle{plain}{%
	\renewcommand{\headrulewidth}{0pt}
	
	\fancyhf{}
	\fancyfoot[c]{%
		\begin{tblr}{c c c}
			\textcolor{principaluno}{$\boldsymbol{-}$}
			& \thepage &
			\textcolor{principaluno}{$\boldsymbol{-}$}
		\end{tblr}
	}
}

% Diseño de los encabezados y pies de página
\fancypagestyle{fancy}{%
    \xpretocmd\headrule{\color{principaluno}}{}{\PatchFailed}% Cambio de color de la regla en el encabezado
    
    \fancyhf{}
    \fancyhead[le]{%
    	\begin{tblr}{
			colspec = {Q[c,m] Q[l,m]},
			colsep = 2pt
		}
    		\includegraphics[
				align=c,
				width=3ex]{imágenes/escudos/fcunam.png}% Escudo de la instittución
    		& {\small{Facultad de Ciencias UNAM}}
    	\end{tblr}
    }
    \fancyhead[re]{%
    	\small\textit{\the\subject}% Nombre de la asignatura
    }
    
    \fancyhead[co]{%
        \begin{tblr}{c c c}
            \phantom{\includegraphics[width=3ex]{imágenes/escudos/fcunam.png}} & \small\textit{\the\subtitle} & \phantom{\includegraphics[width=3ex]{imágenes/escudos/fcunam.png}}
        \end{tblr}
    }
    
    \fancyfoot[c]{%
    	\begin{tblr}{c c c}
    		\textcolor{principaluno}{$\boldsymbol{-}$}
    		& \thepage &
    		\textcolor{principaluno}{$\boldsymbol{-}$}
    	\end{tblr}
    }

}
