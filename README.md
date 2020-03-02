# EV3-Tracker
Управление роботом Lego EV3 и отслеживание линии
В данном проекте разбирается работа с EV3 Lego Mindstorms на примере реализации удаленного управления роботом, 
запуска программ в режиме Standalone и также реализация алгоритма отслеживания роботом линии и движения по ней.
# Запускаем проект
Запустить проект можно с помощью файла EV3_Tracker.prj
# Разбор проекта
1. В Simulink-модели ControlEV3_Host_mode/Model/Simulink_host.slx реализовано управление роботом в режиме реального 
времени с компьютера(Host mode). Управление роботом осуществляется через Driving panel:
+ включение\выключение робота
+ задание сигнала скорости(от 1 до 100)
+ задание направления робота(влево\прямо\направо)
+ задание движения робота(ввперед\назад)
Чтобы выполнить данную программу на роботе, необходимо:
+ Во вкладке HARDWARE выбрать в графе PREPARE инструмент Hardware Settings и настроить в Hardware Implementation 
подключение к роботу(его IP,ID и способ подключения)
+ Убедившись, что Hardware Board - LEGO MINDSTORMS EV3, выполнить команду Monitor&Tune 
+ Самое интересное - Управление роботом!
++ Чтобы остановить выполнение программы, можно нажать кнопку "Back" на роботе либо кнопку "Stop" в Simulink.

2. В Simulink-модели LineTracking_PID\SimulinkLineTracking_Model\models\Model_Main_V2.slx можно увидеть симуляцию модели робота:
+ движение по прямой линии(кнопка Simulink Line) 
+ движение по дорожке(кнопка Simulink Road)
Для запуска симуляции нужно выбрать, какое движение вы хотите смоделировать и нажать соответствующую кнопку, далее нажать во вкладке
SIMULATION кнопку Run.

Также реализован алгоритм движения по линии с ПИД-контроллером(кнопка Run on EV3), 
который можно запустить на роботе также, как это было сделано выше, в пункте 1.
Был подобран ПИД-контроллер и реализован алгоритм движения по линии(черная на фоне белого), в качестве датчика использовался датчик цвета.
Также в данной модели можно управлять сигналом скорости(от 0 до 100)

3. В Simulink-модели LineTracking_without_PID\SimulinkLineTracking_without_PID.slx реализован алгоритм движения по линии без
ПИД-контроллера.
+ Есть панель управления сигналом скорости
+ Кнопка включения\выключения
+ Указания направления движения(вперед\назад)
Алгоритм реализован на основе Stateflow и датчика цвета
4. В Simulink-модели LineTracking_PID\SimulinkLineTracking_Host_v1\SimulinkLineTracking.slx реализован алгоритм движения по линии с ПИД-контроллером.
+ Есть панель управления сигналом скорости
+ Кнопка включения\выключения
+ Обратная связь по датчику цвета

5. Также в папке LineTracking_PID\SimulinkLineTracking_Model\models\ :
+ Step1_Processing_and_Finding_TF.mlx live-script файл - нахождение передаточной функции мотора EV3
+ EstimatingFunctionForLine.slx - нахождение графика зависимости координаты робота от значения, принимаемого с датчика цвета
(32 - белый, 3 - черный) с переходом между цветами для дальнейшего использования в модели.
+ Map_function.mlx - создание карты, на которой будет двигаться робот в модели(линия и дорога)
+ Model_for_frequency_estimating.slx - модель, которая получает с робота данные по энкодеру и сигналу скорости для дальнейшего
использования при нахождении передаточной функции мотора EV3
+ ParameterEstimationForLine.slx - модель датчика цвета для движения по линии

# Как скачать

Выполните в MATLAB

```MATLAB
eval(webread('https://git.io/Jv24V'))
```

ИЛИ

- [Скачайте архив](https://github.com/ETMC-Exponenta/EV3-Tracker/archive/master.zip)
- Распакуйте
- Откройте в MATLAB файл *EV3-Tracker.prj*



# Дополнительная информация
Все модели можно запустить из проекта во вкладке PROJECT SHORTCUTS:
+ В графе MODELS представлены все проекты
1.  EV3 - Tracker_fullmodel - ярлык файла LineTracking_PID\SimulinkLineTracking_Model\models\Model_Main_V2.slx
Нажав на эту кнопку, вы откроете модель, где можно увидеть симуляцию модели робота:
+ движение по прямой линии(кнопка Simulink Line) 
+ движение по дорожке(кнопка Simulink Road)
+ алгоритм движения по линии с ПИД-контроллером(Host mode)
2. EV3 - Tracker_hostmode - ярлык файла ControlEV3_Host_mode/Model/Simulink_host.slx
Нажав на эту кнопку, вы откроете модель, где  реализовано управление роботом в режиме реального 
времени с компьютера(Host mode).
3. EV3 - Tracker_linetracking - ярлык файла LineTracking_PID\SimulinkLineTracking_Host_v1\SimulinkLineTracking.slx
Нажав на эту кнопку, вы откроете модель, где реализован алгоритм движения робота по линии с ПИД - контроллером в режиме Host mode
4. EV3 - Tracker_linetracking_without_PID - ярлык файла LineTracking_without_PID\SimulinkLineTracking_without_PID.slx
Нажав на эту кнопку, вы откроете модель, где реализован алгоритм движения робота по линии без ПИД - контроллера в режиме Host mode
+ В графе FUNCTIONS представлены вспомогательные функции 
1. CleanTrashFolder - очистка временных и кэш-файлов и из ппки Trash.
2. Clear Workspace and Command Window - очистить коммандную строку и рабочую область
