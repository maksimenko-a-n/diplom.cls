# diplom.cls 
### LaTeX class for diplom typing in Russian (Yaroslavl State University).
(LaTeX шаблон для написания дипломных и курсовых работ в ЯРГУ)
***
## Шаблон для написания дипломной работы и подготовки презентации в издательской системе LaTeX, с учетом требований, предъявляемых к выпускным квалификационным работам ЯрГУ им. П.Г. Демидова.
***
### Структура репозитория:

 * [Installing.txt](./Installing.txt) -- инструкции по установке и настройке LaTeX под Windows;
 * [bin](./bin)
   * [diplExample.pdf](./bin/diplExample.pdf) - пример собранной (pdf) версии дипломной работы
   * [presentation.pdf](./bin/presentation.pdf) - пример собранной (pdf) версии презентации
 * [manuals](./manuals)
   * [Syutkin](./manuals/Syutkin)
   * [Syutkin.zip](./manuals/Syutkin/Syutkin.zip) -- руководства В. Сюткина для начинающих знакомство с системой LaTeX;
 * [presentation](./presentation)
   * [resources](./presentation/resources)
     * [img](./presentation/resources/img)
     * [apple.jpg](./presentation/resources/img/apple.jpg) -- пример картинки
     * [LogoYarSU.png](./presentation/resources/img/LogoYarSU.png) -- логотип ЯРГУ (для оформления презентации)
   * [presentation.tex](./presentation/presentation.tex) -- пример презентации дипломной (ВКР) работы;
 * [diplom](./diplom)
   * [diplom.cls](./diplom/diplom.cls) -- пример оформления дипломной (ВКР) или курсовых работы
   * [resources](./diplom/resources) -- ресурсы (изображения, фрагменты кода, используемые в работе)
     * [src](./diplom/resources/src) -- каталог для файлов исходного кода.
       * [sort.cpp](./diplom/resources/src/sort.cpp) -- пример исходного кода программы на C++;
     * [addons](./diplom/resources/addons) -- каталог для оформления внешних приложений в формате tex
       * [appendix2.tex](./diplom/resources/addons/appendix2.tex) -- пример внешнего приложения
     * [img](./diplom/resources/img) -- каталог для используемых изображений
     * [apple.jpg](./diplom/resources/img/apple.jpg) -- пример картинки
   * [includes](./diplom/includes) -- содержит файлы, расширяющие базовый шаблон (макросы, описания оформления различных языков программирование и т.п)
     * [macros](./diplom/includes/macros)
       * [base.tex](./diplom/includes/macros/base.tex) - базовые макросы
     * [lstset](./diplom/includes/lstset) 
     * [base.tex](./diplom/includes/lstset/base.tex) - описание базового оформления исходного кода, встраиваемого в работу.
   * [diplExample.tex](./diplom/diplExample.tex) -- основной файл -- пример оформления дипломной работы;
***
### Дополнительные материалы:
### Открытые источники научных публикаций:
* [Кибирленинка - бесплатная библиотека научных публикаций](https://cyberleninka.ru/)
* [Гугл.Академия - поиск по научным публикациям от Google](https://scholar.google.ru/)
* [ELibrary - библиотека РИНЦ-публикаций](https://elibrary.ru/querybox.asp?scope=newquery)
* [Российская государственная библиотека](https://search.rsl.ru/#ff=30.05.2019&s=fdatedesc)
***
### Проверка уровня заимствований
Внимание - ресурсы предназначены для самопроверки, а не для завышения показателей путем обхода их метрик и изменения лексических конструкций.

https://www.antiplagiat.ru/


https://advego.com/plagiatus/
