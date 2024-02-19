# Flutter_HW1
 Мобильное приложение для просмотра новостных статей с двумя экранами
 
 APK файл : https://github.com/prettycrewcutyulia/Flutter_HW1/blob/main/app-release.apk

# Основные критерии:
 ## Основной экран:
 Представляет собой экран с tab bar сверху и лентой новостей
 ![](/screenshots/основной.png)
 ## Дополнительный экран:
 Открывается при нажатии на новость и имеет кнопку Подробнее(Learn more...), при нажатии на которую открывается браузер
 ![](/screenshots/дополнительный.png)
 ## Поддержаны темная и светлая тема
 Изменить тему можно нажав на кнопку в правом верхнем углу. При этом измениться иконка смены темы.
 ![](/screenshots/темная_тема.png)
 # Дополнительные критерии:
 ## Реализован tab bar 
 С помошью него можно выбрать интересующую вас тему новостей. Просто прокручиваем горизонтально.
 ![](/screenshots/tabbar.png)
## Реализован механизм пагинации 
При пролистывании новостей до конца, приложение подгрузит еще, при этом покажет колесико загрузки.
## Реализована интернационализация
В левом верхнем углу можно изменить язык приложения, который храниться в SharedPreferences. 

Можно заметить, что здесь вместо фотографии беовй фон это сделано, так как используемое апи предоставляет российские новости без фото.
![](/screenshots/интернац.png)
