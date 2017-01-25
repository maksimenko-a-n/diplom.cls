%% 
%% This is file diplom.cls
%% It is based on report.cls
%% 
%% Developed by: Aleksandr Maksimenko, maximenko.a.n@gmail.com
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{diplom}[2016/10/20 Provides the format for diploms]
% Загружаем report.cls со всеми опциями, переданными в diplom
\LoadClassWithOptions{report} 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Подключаем основные пакеты
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\input{glyphtounicode.tex} % Правильная кодировка символов в PDF
\pdfgentounicode=1
%\RequirePackage{cmap} % Правильная кодировка символов в PDF (устар.)
\RequirePackage[T2A]{fontenc} % Внутренняя кодировка TeX-а
\RequirePackage[cp1251]{inputenc} % Кодировка файла
\RequirePackage[english,russian]{babel} % Русификация, таблица переносов и т.п.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Настраиваем стиль заголовков
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%\RequirePackage[dotinlabels]{titletoc} % Точки в номерах разделов в содержании
\RequirePackage[newlinetospace]{titlesec} % Опция newlinetospace заменяет \\ на пробелы в содержании
%\titlelabel{\thetitle.\quad} % Точки в номерах разделов
\titleformat{\chapter}[hang]{%
	\filcenter\normalfont\Large\bfseries% The format of the whole title: label and text
	}{\stepcounter{chapternum}% Увеличиваем независимый счетчик глав
		\chaptertitlename\ \thechapter.% The label
	}{1em}{}
% The standart definition of the chapter title format
%\titleformat{\chapter}[display]{\normalfont\huge\bfseries}{\chaptertitlename\ \thechapter.}{20pt}{\Huge}
\titleformat{\section}[hang]{%
	\normalfont\large\bfseries% The format of the whole title: label and text
	}{\thesection.\ % The label
	}{1em}{}
\titleformat{\subsection}[hang]{%
	\normalfont\bfseries% The format of the whole title: label and text
	}{\thesubsection.% The label
	}{1em}{}
\titlespacing{\chapter}{0pt}{*3.5}{*3.5}
\titlespacing{\section}{0pt}{\beforetitleunit}{\aftertitleunit}
\titlespacing{\subsection}{0pt}{\beforetitleunit}{\aftertitleunit}

% Создаем команду для ненумерованной главы
\newcommand*{\chapternonum}[1]{\chapter*{#1}\addcontentsline{toc}{chapter}{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Стиль заголовков в приложениях
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\AtBeginDocument{\let\oldappendix=\appendix
	\renewcommand{\appendix}{%
		%\setcounter{chapternum}{\value{chapter}}
		\oldappendix
		% Нумерация приложений русскими буквами
		\renewcommand{\thechapter}{\Asbuk{chapter}}
		% Оформление заголовка приложения
		\titleformat{\chapter}[display]%
		{\normalfont\Large\bfseries% The format of label and text
		}{\stepcounter{appnum}% Увеличиваем независимый счетчик приложений
		\filleft\normalfont\Large\chaptertitlename\ \thechapter% The label
		}{0pt}{\filcenter}
		\titlespacing{\chapter}{0pt}{0pt}{*3.5}
	}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Оформление содержания
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Содержание
\AtBeginDocument{\let\oldtableofcontents=\tableofcontents
	\renewcommand{\tableofcontents}[1][Содержание]{%
		\renewcommand{\contentsname}{#1}
		\oldtableofcontents}
}

\RequirePackage[nottoc]{tocbibind} % Добавляем Список литературы в Содержание
% Или добавляем следующую строку сразу после \begin{thebibliography}{9}
%\addcontentsline{toc}{chapter}{\bibname} % Добавляем в содержание


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Заплатка для правильной работы неразрывного дефиса "~ и короткого тире "--
%% russianb.ldf        begin
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand*{\glue}{\nobreak\hskip\z@skip}%  NEW!!!
%\declare@shorthand{russian}{"~}{\textormath{\leavevmode\hbox{-}}{-}}%  OLD!!!
\declare@shorthand{russian}{"~}{\glue\hbox{-}\glue}%  NEW!!!
\def\cdash#1#2#3{\def\tempx@{#3}%
	\def\tempa@{-}\def\tempb@{~}\def\tempc@{*}%
	\ifx\tempx@\tempa@\@Acdash\else
	\ifx\tempx@\tempb@\@Bcdash\else
	\ifx\tempx@\tempc@\@Ccdash\else
	%\errmessage{Wrong usage of cdash}%  OLD!!!
	\@Dcdash#3\fi\fi\fi}%  NEW!!!
%\def\@Acdash{\ifdim\lastskip>\z@\unskip\nobreak\hskip.2em\fi
%  \cyrdash\hskip.2em\ignorespaces}%
%\def\@Bcdash{\leavevmode\ifdim\lastskip>\z@\unskip\fi%  OLD!!!
% \nobreak\cyrdash\penalty\exhyphenpenalty\hskip\z@skip\ignorespaces}%  OLD!!!
%\def\@Ccdash{\leavevmode
% \nobreak\cyrdash\nobreak\hskip.35em\ignorespaces}%
\def\@Bcdash{\,\textendash\,\hskip\z@skip\ignorespaces}%  NEW!!!
\def\@Dcdash#1{\,\textendash\,\hskip\z@skip\ignorespaces#1}%  NEW!!!
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% russianb.ldf        end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Подписи для рисунков и таблиц 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[justification=centering, margin=2em, labelfont=bf]{caption}
\DeclareCaptionLabelSeparator*{emdash}{~--- }
\captionsetup{labelsep=emdash, figurewithin=none}
%\DeclareCaptionFormat{rustable}{\hfill #1\\[3pt]\centering\bf{}#3\par}
%format=rustable
\DeclareCaptionLabelFormat{rtable}{\hfill #1~#2}
\captionsetup[table]{labelformat=rtable, labelsep=newline, labelfont=normalfont, textfont=bf, position=above, margin=0em}
%\intextsep=8pt % Отбивки сверху и снизу рисунка (таблицы)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Настраиваем оформление списков
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{enumitem} 
\setlist{noitemsep, leftmargin=\parindent}
\setlist[itemize]{label=--}


%\RequirePackage[overload]{textcase} % Some upgrade for UpperCase

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Титульная страница
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Определяем переменные для элементов титульной страницы
\newcommand*{\LetterHead}[1]{\gdef\@LetterHead{#1}}
\newcommand*{\Kafedra}[1]{\gdef\@Kafedra{#1}}
\newcommand*{\ZavName}[1]{\gdef\@ChairName{#1}}
\newcommand*{\ZavStatus}[1]{\gdef\@ChairStatus{#1}}
\newcommand*{\ZavKaf}[2]{\gdef\@ChairStatus{#1}\gdef\@ChairName{#2}}
\newcommand*{\OverTitle}[1]{\gdef\@DocumentType{#1}}
\newcommand*{\DocumentType}[1]{\gdef\@DocumentType{#1}}
\newcommand*{\Napr}[1]{\gdef\@Napr{#1}}
\newcommand*{\Title}[1]{\gdef\@Title{#1}}
\newcommand*{\AuthorName}[1]{\gdef\@AuthorName{#1}}
\newcommand*{\AuthorStatus}[1]{\gdef\@AuthorStatus{#1}}
\newcommand*{\Author}[2]{\gdef\@AuthorStatus{#1}\gdef\@AuthorName{#2}}
\newcommand*{\ChiefName}[1]{\gdef\@ChiefName{#1}}
\newcommand*{\ChiefStatus}[1]{\gdef\@ChiefStatus{#1}}
\newcommand*{\Chief}[2]{\gdef\@ChiefStatus{#1}\gdef\@ChiefName{#2}}
\newcommand*{\City}[1]{\gdef\@City{#1}}
\newcommand*{\Year}[1]{\gdef\@Year{#1}}

\newif\ifkursovaya % Флаг для курсовой
\kursovayafalse % По умолчанию -- не курсовая
\newcommand*{\Kursovaya}{\kursovayatrue}

% Инициализируем элементы титульной страницы
\LetterHead{МИНОБРНАУКИ РОССИИ \\
	Федеральное государственное бюджетное образовательное\\ учреждение высшего образования\\
	<<Ярославский государственный университет имени П.\,Г.~Демидова>>}
\Kafedra{Кафедра теоретической информатики}
\ZavStatus{Заведующий кафедрой,\\ д.\,ф.-м.\,н., профессор}
\ZavName{С.\,С.~Сидоров}
\DocumentType{Выпускная квалификационная работа бакалавра}
\Napr{02.03.02 Фундаментальная информатика и информационные технологии}
\Title{Название дипломной работы}
\ChiefStatus{Научный руководитель\\ к.\,ф.-м.\,н., доцент}
\ChiefName{П.\,П.~Петров}
\AuthorStatus{Студент группы ИТ-41БО}
\AuthorName{И.\,И.~Иванов}
\City{Ярославль}
\Year{\the\year} % this year

% Создаем заготовку для блока Подпись
%\newcommand*{\RightTitleWidth}{6cm} % Ширина правой колонки
\newlength{\VisaWidth} % Переменная -- ширина правой колонки
\setlength{\VisaWidth}{6cm} % Инициализируем ширину правой колонки
\newcommand*{\SignDate}{\\[3pt]<<\rule{1cm}{0.5pt}>>\hrulefill\ \@Year~г.} % Дата
\newcommand*{\SignBlock}[1]{%
   \vspace{0.5\baselineskip}
   \hbox to \textwidth{%
   \hfill%
   \begin{minipage}[t]{\VisaWidth}
     \begin{flushleft}
       #1
     \end{flushleft}
   \end{minipage}%
   \vspace{1.1\baselineskip}
   }%
}
\newcommand*{\StandardSign}[2]{%
    \SignBlock{#1\\[\baselineskip]
	\hrulefill\ #2
	\SignDate}
}

% Структурное описание титульной страницы
\renewcommand*{\maketitle}{%
\begin{titlepage}
	% Если пакет hyperref подключен,	
	% добавляем в свойства PDF-документа Название и Автора
	\@ifundefined{hypersetup}{}{
		\hypersetup{pdftitle = \@Title, %pdfsubject,
			pdfauthor = \@AuthorName%, pdfkeywords
		}
	}
	%\@ifpackageloaded{hyperref}{}{}
	%\thispagestyle{empty}
	\begin{center}
	  %\small 
	  {\@LetterHead}\\[0.5\baselineskip]
	  {\@Kafedra}\\
	\end{center}
	\ifkursovaya
		\vfill
	\else
		%\StandardSign{<<Допустить к защите>>\\ \@ChairStatus}{\@ChairName}
		\SignBlock{Сдано на кафедру \SignDate\\
			\@ChairStatus\\[\baselineskip]
			\hrulefill\ \@ChairName%
		}
	\fi  
	\begin{center}
	    {\large \@DocumentType}\\[\baselineskip]
	    {\large \textbf{\@Title}}\\[\baselineskip]
	    {\small\footnotesize по направлению \@Napr}\\[\baselineskip]
	\end{center}
	\StandardSign{\@ChiefStatus}{\@ChiefName}
	\StandardSign{\@AuthorStatus}{\@AuthorName}
	\vfill\strut
	\centerline{\@City, \@Year}
\end{titlepage}
\setcounter{page}{2}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Оформление ключевых слов
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand*{\Keywords}[1]{%
	Ключевые слова: \textbf{#1}
	% Опция pdfkeywords для hyperref работает только в самом начале документа
	%\@ifundefined{hypersetup}{}{\hypersetup{pdfkeywords={#1}}}
	}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Счетчики для первой строки автореферата
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{totcount}
\regtotcounter{page} % Total number of pages
\newtotcounter{chapternum} % Total number of chapters
\newtotcounter{appnum} % Total number of apps
\newtotcounter{bibnum} % Total number of bibitems
\let\oldbibitem=\bibitem
\def\bibitem{\stepcounter{bibnum}\oldbibitem}

% В каждой главе счетчики рисунков и таблиц обнуляются.
% Поэтому заводим специальные счетчики для общего числа
\newtotcounter{fignum} % Total number of figures
\newtotcounter{tablenum} % Total number of tables
\AtBeginDocument{%
	% Следующие две команды должны отработать непосредственно после \begin{document}
	\let\oldcaption=\caption
	\def\caption{\def\floatf{figure}\ifx\floatf\@captype\stepcounter{fignum}\else\stepcounter{tablenum}\fi\oldcaption}%
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Математические формулы, символы и окружения типа теорем
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{amsmath} % Базовый пакет для математики
\RequirePackage{amsthm}  % Окружения типа теорем
\RequirePackage{amssymb} % Дополнительные символы и шрифты

\RequirePackage{mathtools} % Дополнительные возможности для набора формул
\providecommand\given{} % Для вертикальной черты, определяющей начало условия
% Создаем команду для оформления множеств
\newcommand\SetSymbol[1][]{%
	\nonscript\:#1\vert
	\allowbreak \nonscript\:	\mathopen{}}
\DeclarePairedDelimiterX\Set[1]\{\}{%
	\renewcommand\given{\SetSymbol[\delimsize]}	#1}
% Условная вероятность
\DeclarePairedDelimiterXPP\Pb[1]{\mathsf{P}}(){}{
	\renewcommand\given{\nonscript\:\delimsize\vert\nonscript\:\mathopen{}}	#1}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Переподчиняем счетчики рисунков и формул
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{chngcntr}
%\counterwithout{figure}{chapter} % Отвязываем счетчик рисунков от счетчика глав
\counterwithout{equation}{chapter} % Отвязываем счетчик формул от счетчика глав
\let\numberwithin=\counterwithin % Иначе \numberwithin (из amsmath) и \counterwithin могут конфликтовать



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\endinput
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% End of file `diplom.cls'. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
