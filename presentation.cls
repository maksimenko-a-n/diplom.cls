%% 
%% This is file presentation.cls
%% It is based on beamer.cls
%% 
%% Developed by: Aleksandr Maksimenko, maximenko.a.n@gmail.com
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{presentation}[2017/01/20 Provides the format for diploms]
% Загружаем beaner.cls со всеми опциями, переданными в diplom
\LoadClassWithOptions{beamer} 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Подключаем основные пакеты
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\input{glyphtounicode.tex} % Правильная кодировка символов в PDF
\pdfgentounicode=1
%\RequirePackage{cmap} % Правильная кодировка символов в PDF (устар.)
\RequirePackage[T2A]{fontenc} % Внутренняя кодировка TeX-а
\RequirePackage[cp1251]{inputenc} % Кодировка файла

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Настраиваем стиль презентации
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Выбираем цветовую тему
\usecolortheme{whale}
%\usecolortheme{dolphin} 
%\usetheme{warsaw}
%\usetheme{Madrid}
%\usepackage{BeamerColor}
%\usecolortheme[named=SteelBlue4]{structure}

\useinnertheme{rounded} % Скругляем углы блоков
\useoutertheme{infolines} % Добавляем колонтитулы
\setbeamertemplate{headline}{} % Убираем верхний колонтитул
\setbeamertemplate{navigation symbols}{} % Убираем навигационные символы
\usefonttheme[stillsansseriftext, stillsansserifsmall]{serif} % шрифт с засечками в формулах и заголовках
\usefonttheme[onlysmall]{structurebold} % жирный шрифт в колонтитулах
%\setbeamerfont*{frametitle}{size=\normalsize,series=\bfseries}
\setbeamercovered{transparent} % uncover будет рисовать закрытые части текста серым
%\setbeamercovered{invisible} % а так -- невидимым
% Определяем цвет структурных элементов
\definecolor{unicover}{rgb}{0.10,0.35,0.62} 
\setbeamercolor{structure}{fg=unicover}
% Добавляем логотип университета
\pgfdeclareimage[height=1.5cm]{university-logo}{LogoYarSU.png}
\logo{\pgfuseimage{university-logo}}

% Делим нижний колонтитул на три части: автор, название, число слайдов
\newcommand{\makefootline}[3]{
	\setbeamertemplate{footline}{
		\leavevmode%
		\hbox{%
			\begin{beamercolorbox}[wd=#1\paperwidth,ht=2.25ex,dp=1ex,center]{author in head/foot}
				\usebeamerfont{author in head/foot}%
				\insertshortauthor
			\end{beamercolorbox}%
			\begin{beamercolorbox}[wd=#2\paperwidth,ht=2.25ex,dp=1ex,center]{title in head/foot}%
				\usebeamerfont{title in head/foot}\insertshorttitle
			\end{beamercolorbox}%
			\begin{beamercolorbox}[wd=#3\paperwidth,ht=2.25ex,dp=1ex,right]{date in head/foot}%
				\insertframenumber{} / \inserttotalframenumber\hspace*{2ex}
			\end{beamercolorbox}
		}%
	}
}

% Делаем блоки прозрачными, чтобы они не закрывали логотип
\setbeamertemplate{blocks}[default]
\setbeamercolor{block title}{bg=}
\setbeamercolor{block body}{bg=}

% Для перевода английских названий блоков типа Example, Theorem, ...
\languagepath{russian}
\renewcommand{\proofname}{Доказательство}

\endinput
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% End of file `presentation.cls'. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
