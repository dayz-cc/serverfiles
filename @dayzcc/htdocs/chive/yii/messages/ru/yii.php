<?php
/**
 * Message translations.
 *
 * This file is automatically generated by 'yiic message' command.
 * It contains the localizable messages extracted from source code.
 * You may modify this file by translating the extracted messages.
 *
 * Each array element represents the translation (value) of a message (key).
 * If the value is empty, the message is considered as not translated.
 * Messages that no longer need translation will have their translations
 * enclosed between a pair of '@@' marks.
 *
 * NOTE, this file must be saved in UTF-8 encoding.
 *
 * @version $Id: $
 */
return array (
  'The comment of {method} does not match its parameter declaration. Parameter {name} is not found in the method comment.' => 'Комментарий метода {method} не совпадает с объявленнием его параметров. Параметр {name} не найден в комментарии метода.',
  'The {method} has {count} parameters, but {count2} are declared in the method comment.' => 'Метод {method} содержит {count} параметров. В комментарии метода описаны {count2}.',
  '"{path}" is not a valid directory.' => 'Путь "{path}" не является правильной директорией.',
  '&lt; Previous' => '&lt; Предыдущая',
  '&lt;&lt; First' => '&lt;&lt; Первая',
  'Active Record requires a "db" CDbConnection application component.' => 'ActiveRecord требует компонент приложения "db" CDbConnection.',
  'Active record "{class}" has an invalid configuration for relation "{relation}". It must specify the relation type, the related active record class and the foreign key.' => 'Отношение "{relation}" класса Active record "{class}" сконфигурировано не верно. Вы должны указать тип отношения, связанный отношением класс active record и внешний ключ.',
  'Active record "{class}" is trying to select an invalid column "{column}". Note, the column must exist in the table or be an expression with alias.' => 'ActiveRecord "{class}" пытается выбрать недопустимый столбец "{column}". Примечание: столбец должен существовать в таблице или являться выражением с алиасом.',
  'Active record class "{class}" does not have a scope named "{scope}".' => 'В классе ActiveRecord "{class}" нет именованной группы условий "{scope}".',
  'Alias "{alias}" is invalid. Make sure it points to an existing PHP file.' => 'Псевдоним "{alias}" неверен. Убедитесь, что он указывает на существующий PHP файл.',
  'Alias "{alias}" is invalid. Make sure it points to an existing directory or file.' => 'Неправильный алиас "{alias}". Убедитесь, что он указывает на существующую директорию или файл.',
  'Application Log' => 'Журнал приложения',
  'Application base path "{path}" is not a valid directory.' => 'Базовый (base) путь приложения "{path}" не является директорией.',
  'Application runtime path "{path}" is not valid. Please make sure it is a directory writable by the Web server process.' => 'Рабочий (runtime) путь приложения "{path}" задан неверно. Удостоверьтесь, что директория доступна для записи пользователю, под которым запущен веб-сервер.',
  'Authorization item "{item}" has already been assigned to user "{user}".' => 'Элемент (item) авторизации "{item}" уже назначен пользователю "{user}".',
  'Base path "{path}" is not a valid directory.' => 'Базовый путь "{path}" задан неверно.',
  'CApcCache requires PHP apc extension to be loaded.' => 'CApcCache требует загруженного расширения PHP APC.',
  'CAssetManager.basePath "{path}" is invalid. Please make sure the directory exists and is writable by the Web server process.' => 'Путь CAssetManager.basePath "{path}" задан неверно. Удостоверьтесь, что директория существует и доступна для записи пользователю, под которым запущен веб-сервер.',
  'CCacheHttpSession.cacheID is invalid. Please make sure "{id}" refers to a valid cache application component.' => 'Идентификатор CCacheHttpSession.cacheID задан неверно. Удостоверьтесь, что "{id}" соответствует существующему компоненту кэша приложения.',
  'CCaptchaValidator.action "{id}" is invalid. Unable to find such an action in the current controller.' => 'Действие CCaptchaValidator.action "{id}" задано неверно: действия не найдено в текущем контроллере.',
  'CDbAuthManager.connectionID "{id}" is invalid. Please make sure it refers to the ID of a CDbConnection application component.' => 'Идентификатор CDbAuthManager.connectionID "{id}" задан неверно. Удостоверьтесь, что он соответствует идентификатору (ID) компонента CDbConnection вашего приложения.',
  'CDbCache.connectionID "{id}" is invalid. Please make sure it refers to the ID of a CDbConnection application component.' => 'Идентификатор CDbCache.connectionID "{id}" задан неверно. Удостоверьтесь, что он соответствует идентификатору (ID) компонента CDbConnection вашего приложения.',
  'CDbCacheDependency.sql cannot be empty.' => 'Файл CDbCacheDependency.sql должен содержать какие-либо запросы.',
  'CDbCommand failed to execute the SQL statement: {error}' => 'CDbCommand не удалось исполнить SQL-запрос: {error}',
  'CDbCommand failed to prepare the SQL statement: {error}' => 'CDbCommand не удалось подготовить SQL-запрос: {error}',
  'CDbConnection does not support reading schema for {driver} database.' => 'CDbConnection не поддерживает чтения из базы данных {driver}.',
  'CDbConnection failed to open the DB connection.' => 'CDbConnection не удалось устоновить соединение с БД.',
  'CDbConnection failed to open the DB connection: {error}' => 'CDbConnection не удалось открыть соединение с базой данных: {error}',
  'CDbConnection is inactive and cannot perform any DB operations.' => 'Соединение CDbConnection не активно, операции над базой данных невозможны.',
  'CDbConnection.connectionString cannot be empty.' => 'Параметр CDbConnection.connectionString должен быть заполнен.',
  'CDbDataReader cannot rewind. It is a forward-only reader.' => 'Компонент CDbDataReader не поддерживает обратное чтение. Этот компонент только для чтения в прямом направлении.',
  'CDbHttpSession.connectionID "{id}" is invalid. Please make sure it refers to the ID of a CDbConnection application component.' => 'Идентификатор CDbHttpSession.connectionID "{id}" задан неверно. Удостоверьтесь, что он соответствует идентификатору (ID) компонента CDbConnection вашего приложения.',
  'CDbLogRoute.connectionID "{id}" does not point to a valid CDbConnection application component.' => 'Идентификатор CDbLogRoute.connectionID "{id}" указывает на неверный компонент CDbConnection вашего приложения.',
  'CDbMessageSource.connectionID is invalid. Please make sure "{id}" refers to a valid database application component.' => 'CDbMessageSource.connectionID указан неверно. Удостоверьтесь, что "{id}" указывает на правильный компонент для работы с базой данных вашего приложения.',
  'CDbTestFixture.connectionID "{id}" is invalid. Please make sure it refers to the ID of a CDbConnection application component.' => 'CDbTestFixture.connectionID "{id}" неверный. Убедитесь, что он указывает на ID компонента приложения CDbConnection.',
  'CDbTransaction is inactive and cannot perform commit or roll back operations.' => 'Компонент CDbTransaction не активен, операции фиксации (commit) и отката (roll back) не могут быть совершены.',
  'CDirectoryCacheDependency.directory cannot be empty.' => 'Параметр CDirectoryCacheDependency.directory должен быть заполнен.',
  'CEAcceleratorCache requires PHP eAccelerator extension to be loaded, enabled or compiled with the "--with-eaccelerator-shared-memory" option.' => 'Для работы CEAcceleratorCache требуется загруженное расширение PHP eAccelerator. Оно должно быть включено или скомпилировано с опцией "--with-eaccelerator-shared-memory".',
  'CFileCacheDependency.fileName cannot be empty.' => 'Параметр CFileCacheDependency.fileName должен быть заполнен.',
  'CFileLogRoute.logPath "{path}" does not point to a valid directory. Make sure the directory exists and is writable by the Web server process.' => 'Путь CFileLogRoute.logPath "{path}" задан неверно. Удостоверьтесь, что директория существует и доступна для записи пользователю, под которым запущен веб-сервер.',
  'CFilterChain can only take objects implementing the IFilter interface.' => 'CFilterChain может содержать только объекты реализующие интерфейс IFilter.',
  'CFlexWidget.baseUrl cannot be empty.' => 'Параметр CFlexWidget.baseUrl должен быть заполнен.',
  'CFlexWidget.name cannot be empty.' => 'Параметр CFlexWidget.name должен быть заполнен.',
  'CGlobalStateCacheDependency.stateName cannot be empty.' => 'Параметр CGlobalStateCacheDependency.stateName должен быть заполнен.',
  'CHttpCookieCollection can only hold CHttpCookie objects.' => 'CHttpCookieCollection может содержать только объекты типа CHttpCookie.',
  'CHttpRequest is unable to determine the entry script URL.' => 'Компоненту CHttpRequest не удалось определить URL входного скрипта.',
  'CHttpRequest is unable to determine the path info of the request.' => 'Компоненту CHttpRequest не удалось определить информацию о пути, содержащуюся в запросе.',
  'CHttpRequest is unable to determine the request URI.' => 'Компоненту CHttpRequest не удалось определить URI запроса.',
  'CHttpSession.cookieMode can only be "none", "allow" or "only".' => 'Параметр CHttpSession.cookieMode может принимать только значения "none", "allow" или "only".',
  'CHttpSession.gcProbability "{value}" is invalid. It must be an integer between 0 and 100.' => 'Значение параметра CHttpSession.gcProbability "{value}" задано неверно. Необходимо указать число от 0 до 100.',
  'CHttpSession.savePath "{path}" is not a valid directory.' => 'Путь CHttpSession.savePath "{path}" не является директорией.',
  'CMemCache server configuration must be an array.' => 'Конфигурация сервера CMemCache должна быть массивом.',
  'CMemCache server configuration must have "host" value.' => 'Конфигурация сервера CMemCache должна содержать значение "host".',
  'CMultiFileUpload.name is required.' => 'Необходимо указать параметр CMultiFileUpload.name.',
  'CProfileLogRoute found a mismatching code block "{token}". Make sure the calls to Yii::beginProfile() and Yii::endProfile() be properly nested.' => 'Компонент CProfileLogRoute обнаружил неверный код "{token}". Удостоверьтесь, что вложенность вызовов Yii::beginProfile() и Yii::endProfile() соблюдается.',
  'CProfileLogRoute.report "{report}" is invalid. Valid values include "summary" and "callstack".' => 'Параметр CProfileLogRoute.report "{report}" задан неверно. Поддерживаются значения "summary" и "callstack".',
  'CSecurityManager requires PHP mcrypt extension to be loaded in order to use data encryption feature.' => 'Для использования возможности шифрования данных компоненту CSecurityManager требуется PHP-расширение mcrypt.',
  'CSecurityManager.encryptionKey cannot be empty.' => 'Параметр CSecurityManager.encryptionKey должен быть заполнен.',
  'CSecurityManager.validationKey cannot be empty.' => 'Параметр CSecurityManager.validationKey должен быть заполнен.',
  'CTypedList<{type}> can only hold objects of {type} class.' => 'CTypedList<{type}> может содержать только объекты класса {type}.',
  'CUrlManager.UrlFormat must be either "path" or "get".' => 'Параметр CUrlManager.UrlFormat может принимать только значения "path" или "get".',
  'CWinCache requires PHP wincache extension to be loaded.' => 'Для работы CWinCache требуется загруженное расширение wincache.',
  'CWinCache user cache is disabled. Please set wincache.ucenabled to On in your php.ini.' => 'Пользовательский CWinCache отключен. Измените wincache.ucenabled на On в вашем php.ini.',
  'CXCache requires PHP XCache extension to be loaded.' => 'Для работы компонента CXCache необходимо PHP-расширение XCache.',
  'CZendDataCache requires PHP Zend Data Cache extension to be loaded.' => 'Для работы CZendDataCache необходимо расширение PHP Zend Data Cache.',
  'Cannot add "{child}" as a child of "{name}". A loop has been detected.' => 'Добавление элемента "{child}" в качестве потомка "{name}" невозможно, обнаружен бесконечный цикл.',
  'Cannot add "{child}" as a child of "{parent}". A loop has been detected.' => 'Добавление элемента "{child}" в качестве потомка "{parent} невозможно, обнаружен бесконечный цикл.',
  'Cannot add "{name}" as a child of itself.' => 'Элемент "{name}" не может стать потомком для самого себя.',
  'Cannot add an item of type "{child}" to an item of type "{parent}".' => 'Нельзя добавить элемент типа "{child}" к элементу типа "{parent}".',
  'Column name must be either a string or an array.' => 'Имя столбца должно быть строкой или массивом.',
  'Either "{parent}" or "{child}" does not exist.' => 'Либо "{parent}", либо "{child}" не существует.',
  'Error: Table "{table}" does not have a primary key.' => 'Ошибка: В таблице "{table}" отсутствует первичный ключ.',
  'Error: Table "{table}" has a composite primary key which is not supported by crud command.' => 'Ошибка: Таблица "{table}" содержит составной первичный ключ, работа с которым не поддерживается командами CRUD.',
  'Event "{class}.{event}" is attached with an invalid handler "{handler}".' => 'Событие "{class}.{event}" привязано неверным обработчиком "{handler}".',
  'Event "{class}.{event}" is not defined.' => 'Событие "{class}.{event}" не определено.',
  'Extension path "{path}" does not exist.' => 'Путь расширения "{path}" не существует.',
  'Failed to initialize the mcrypt module.' => 'Не удалось инициализировать модуль mcrypt.',
  'Failed to set unsafe attribute "{attribute}".' => 'Не удалось присвоить небезопасный атрибут "{attribute}".',
  'Failed to write the uploaded file "{file}" to disk.' => 'Не удалось записать загруженный файл "{file}" на диск.',
  'File upload was stopped by extension.' => 'Загрузка файла прервана расширением.',
  'Filter "{filter}" is invalid. Controller "{class}" does have the filter method "filter{filter}".' => 'Фильтр "{filter}" указан неверно. В коде контроллер "{class}" метод фильтра "filter{filter}" не определен.',
  'Get a new code' => 'Получить новый код',
  'Go to page: ' => 'Перейти к странице: ',
  'Invalid MO file revision: {revision}.' => 'Не поддерживаемая версия MO файла: {revision}.',
  'Invalid MO file: {file} (magic: {magic}).' => 'Ошибка в MO файле: {file} (магия: {magic}).',
  'Invalid enumerable value "{value}". Please make sure it is among ({enum}).' => 'Неверно задано и значение "{value}". Поддерживаются следующие значение ({enum}).',
  'Invalid operator "{operator}".' => 'Неправильный оператор "{operator}".',
  'Last &gt;&gt;' => 'Последняя &gt;&gt;',
  'List data must be an array or an object implementing Traversable.' => 'Список должен быть представлен массивом или объектом, реализующим интерфейс Traversable.',
  'List index "{index}" is out of bound.' => 'Значение списка "{index}" выходит за его пределы.',
  'Login Required' => 'Необходима авторизация',
  'Map data must be an array or an object implementing Traversable.' => 'Карта должна быть представлена массивом или объектом, реализующим интерфейс Traversable.',
  'Missing the temporary folder to store the uploaded file "{file}".' => 'Не найдена временна директория для хранения загруженного файла "{file}".',
  'Next &gt;' => 'Следующая &gt;',
  'No columns are being updated for table "{table}".' => 'Нет столбцов подлежащих обновлению в таблице "{table}".',
  'No counter columns are being updated for table "{table}".' => 'Нет столбцов-счетчиков подлежащих обновлению в таблице "{table}".',
  'Object configuration must be an array containing a "class" element.' => 'Конфигурация объекта должна быть представлена массивом, содержащим элемент "class".',
  'Please fix the following input errors:' => 'Необходимо исправить следующие ошибки:',
  'Property "{class}.{property}" is not defined.' => 'Не определено свойство "{class}.{property}".',
  'Property "{class}.{property}" is read only.' => 'Свойство "{class}.{property}" доступно только для чтения.',
  'Queue data must be an array or an object implementing Traversable.' => 'Запрос должен быть представлен массивом или объектом, реализующим интерфейс Traversable.',
  'Relation "{name}" is not defined in active record class "{class}".' => 'Отношение "{name}" не было определено в active record классе "{class}".',
  'Resetting PK sequence is not supported.' => 'Сброс последовательности для первичного ключа не поддерживается.',
  'Setting integrity check is not supported.' => 'Опция проверки целостности не поддерживается.',
  'Stack data must be an array or an object implementing Traversable.' => 'Стек должен быть представлен массивом или объектом, реализующим интерфейс Traversable.',
  'Table "{table}" does not exist.' => 'Таблица "{table}" не существует.',
  'Table "{table}" does not have a column named "{column}".' => 'Таблица "{table}" не содержит столбца "{column}".',
  'The "filter" property must be specified with a valid callback.' => 'Свойство "filter" должно быть определено правильным обратным вызовом (callback).',
  'The "pattern" property must be specified with a valid regular expression.' => 'Свойство "pattern" должно быть определено правильным регулярным выражением.',
  'The CSRF token could not be verified.' => 'Невозможно определить CSRF.',
  'The STAT relation "{name}" cannot have child relations.' => 'Отношение STAT "{name}" не может содержать другие отношения.',
  'The URL pattern "{pattern}" for route "{route}" is not a valid regular expression.' => 'URL-шаблон "{pattern}" для пути "{route}" не является верным регулярным выражением.',
  'The active record cannot be deleted because it is new.' => 'Невозможно удалить запись active record из-за того, что она новая.',
  'The active record cannot be inserted to database because it is not new.' => 'Невозможно добавить запись active record в базу данных из-за того, что она не новая.',
  'The active record cannot be updated because it is new.' => 'Невозможно обновить запись active record из-за того, что она новая.',
  'The asset "{asset}" to be published does not exist.' => 'Необходимый для отображения asset "{asset}" не существует.',
  'The command path "{path}" is not a valid directory.' => 'Командный путь "{path}" не является директорией.',
  'The controller path "{path}" is not a valid directory.' => 'Путь к контроллерам "{path}" не является директорией.',
  'The file "{file}" cannot be uploaded. Only files with these extensions are allowed: {extensions}.' => 'Файл "{file}" не может быть загружен. Разрешена загрузка файлов только со следующими расширениями: {extensions}.',
  'The file "{file}" is too large. Its size cannot exceed {limit} bytes.' => 'Размер файла "{file}" слишком велик, он не должен превышать {limit} байт.',
  'The file "{file}" is too small. Its size cannot be smaller than {limit} bytes.' => 'Размер файла "{file}" слишком мал, он не должен быть менее {limit} байт.',
  'The file "{file}" was only partially uploaded.' => 'Файл "{file}" был загружен не полностью.',
  'The first element in a filter configuration must be the filter class.' => 'Первым элементом в конфигурации фильтра должен быть его класс.',
  'The item "{name}" does not exist.' => 'Элемента "{name}" не существует.',
  'The item "{parent}" already has a child "{child}".' => 'Элемент "{parent}" уже имеет потомка "{child}".',
  'The layout path "{path}" is not a valid directory.' => 'Путь к шаблонам "{path}" не является директорией.',
  'The list is read only.' => 'Список предназначен только для чтения.',
  'The map is read only.' => 'Карта предназначена только для чтения.',
  'The module path "{path}" is not a valid directory.' => 'Путь модуля "{path}" не является директорией.',
  'The pattern for 12 hour format must be "h" or "hh".' => 'Шаблон для 12-ти часового формата времени: "h", либо "hh".',
  'The pattern for 24 hour format must be "H" or "HH".' => 'Шаблон для 12-ти часового формата времени: "H", либо "HH".',
  'The pattern for AM/PM marker must be "a".' => 'Шаблон маркера AM/PM: "a".',
  'The pattern for day in month must be "F".' => 'Шаблон для дня месяца: "F".',
  'The pattern for day in year must be "D", "DD" or "DDD".' => 'Шаблон для дня в году: "D", "DD", либо "DDD".',
  'The pattern for day of the month must be "d" or "dd".' => 'Шаблон для дня месяца: "d", либо "dd".',
  'The pattern for day of the week must be "E", "EE", "EEE", "EEEE" or "EEEEE".' => 'Шаблон для дня недели:"E", "EE", "EEE", "EEEE", либо "EEEEE".',
  'The pattern for era must be "G", "GG", "GGG", "GGGG" or "GGGGG".' => 'Шаблон для эры: "G", "GG", "GGG", "GGGG", либо "GGGGG".',
  'The pattern for hour in AM/PM must be "K" or "KK".' => 'Шаблон для часа в формате AM/PM: "K", либо "KK".',
  'The pattern for hour in day must be "k" or "kk".' => 'Шаблон для часа в дне: "k", либо "kk".',
  'The pattern for minutes must be "m" or "mm".' => 'Шаблон для минут: "m", либо "mm".',
  'The pattern for month must be "M", "MM", "MMM", "MMMM", "L", "LL", "LLL" or "LLLL".' => 'Шаблон для месяца должен быть  "M", "MM", "MMM", "MMMM", "L", "LL", "LLL" или "LLLL".',
  'The pattern for seconds must be "s" or "ss".' => 'Шаблон для секунд: "s", либо "ss".',
  'The pattern for time zone must be "z" or "v".' => 'Шаблон для временной зоны: "z", либо "v".',
  'The pattern for week in month must be "W".' => 'Шаблон недели в месяце: "W".',
  'The pattern for week in year must be "w".' => 'Шаблон недели в году: "w".',
  'The queue is empty.' => 'Очередь пуста.',
  'The relation "{relation}" in active record class "{class}" is not specified correctly. The join table "{joinTable}" given in the foreign key cannot be found in the database.' => 'Отношение "{relation}" AR модели "{class}" определено некорректно. Таблица "{joinTable}", указанная во внешнем ключе, не найдена в БД.',
  'The relation "{relation}" in active record class "{class}" is not specified correctly: the join table "{joinTable}" given in the foreign key cannot be found in the database.' => 'Отношение "{relation}", определенное в записи active record класса "{class}" ошибочно: в базе данных нет включаемой таблицы "{joinTable}", упомянутой во внешнем ключе.',
  'The relation "{relation}" in active record class "{class}" is specified with a foreign key "{key}" that does not point to the parent table "{table}".' => 'Отношение "{relation}" AR модели "{class}" определено с использованием внешнего ключа "{key}", который не указывает на таблицу-родителя "{table}".',
  'The relation "{relation}" in active record class "{class}" is specified with an incomplete foreign key. The foreign key must consist of columns referencing both joining tables.' => 'Отношение "{relation}", определенное в записи active record класса "{class}", определено неполным внешним ключом. Внешний ключ должен состоять из столбцов, относящихся к обоим объединяемым таблицам.',
  'The relation "{relation}" in active record class "{class}" is specified with an invalid foreign key "{key}". There is no such column in the table "{table}".' => 'Отношение "{relation}" AR модели "{class}" определено с использованием неверного внешнего ключа "{key}". В таблице "{table}" такого столбца не существует.',
  'The relation "{relation}" in active record class "{class}" is specified with an invalid foreign key. The columns in the key must match the primary keys of the table "{table}".' => 'Отношение "{relation}" AR модели "{class}" определено с использованием неверного внешнего ключа. Столбцы ключа должны соответствовать первичным ключам таблицы "{table}".',
  'The relation "{relation}" in active record class "{class}" is specified with an invalid foreign key. The format of the foreign key must be "joinTable(fk1,fk2,...)".' => 'Отношение "{relation}", определенное в записи active record класса "{class}", определено неверным внешним ключом. Формат внешнего ключа должен быть таким: "joinTable(fk1,fk2,...)".',
  'The requested view "{name}" was not found.' => 'Запрашиваемый шаблон вида "{name}" не найден.',
  'The stack is empty.' => 'Стек приложения пуст.',
  'The system is unable to find the requested action "{action}".' => 'Системе не удалось найти запрашиваемое действие "{action}".',
  'The system view path "{path}" is not a valid directory.' => 'Путь к представлениям (view) "{path}" не является директорией.',
  'The table "{table}" for active record class "{class}" cannot be found in the database.' => 'Таблица "{table}", упомянутая в записи active record класса "{class}", не найдена в базе данных.',
  'The value for the column "{column}" is not supplied when querying the table "{table}".' => 'Значение столбца "{column}" не задано при запросе из таблицы "{table}".',
  'The verification code is incorrect.' => 'Неправильный код проверки.',
  'The view path "{path}" is not a valid directory.' => 'Неправильный путь представления: "{path}".',
  'Theme directory "{directory}" does not exist.' => 'Директории темы (theme) "{directory}" не существует.',
  'This content requires the <a href="http://www.adobe.com/go/getflash/">Adobe Flash Player</a>.' => 'Требуется наличие <a href="http://www.adobe.com/go/getflash/">Adobe Flash Player</a>.',
  'Unable to add an item whose name is the same as an existing item.' => 'Невозможно добавить элемент, заданное имя уже используется.',
  'Unable to change the item name. The name "{name}" is already used by another item.' => 'Невозможно сменить имя элемента. Другой элемент уже использует имя "{name}".',
  'Unable to create application state file "{file}". Make sure the directory containing the file exists and is writable by the Web server process.' => 'Не удалось создать файл состояния приложения "{file}". Удостоверьтесь, что директория существует и доступна для записи пользователю, под которым запущен веб-сервер.',
  'Unable to import "{alias}". Please check your server configuration to make sure you are allowed to change PHP include_path.' => 'Не удалось импортировать "{alias}". Проверьте настройки сервера и убедитесь, что вам разрешено менять include_path.',
  'Unable to lock file "{file}" for reading.' => 'Невозможно заблокировать файл "{file}" для чтения.',
  'Unable to lock file "{file}" for writing.' => 'Невозможно заблокировать файл "{file}" для записи.',
  'Unable to read file "{file}".' => 'Невозможно прочесть файл "{file}".',
  'Unable to replay the action "{object}.{method}". The method does not exist.' => 'Невозможно произвести действие "{object}.{method}". Указанного метода не существует.',
  'Unable to resolve the request "{route}".' => 'Невозможно обработать запрос "{route}".',
  'Unable to write file "{file}".' => 'Невозможно записать в файл "{file}".',
  'Unknown authorization item "{name}".' => 'Неизвестный элемент авторизации "{name}".',
  'Unknown type "{type}".' => 'Неизвестный тип "{type}".',
  'Unrecognized locale "{locale}".' => 'Неизвестная локаль "{locale}".',
  'View file "{file}" does not exist.' => 'Файл представления (view) "{file}" не существует.',
  'Yii application can only be created once.' => 'Приложение Yii может быть создано только один раз.',
  'You are not authorized to perform this action.' => 'У вас недостаточно прав для выполнения указанного действия.',
  'Your request is not valid.' => 'Обнаружена ошибка в вашем запросе.',
  '{attribute} "{value}" has already been taken.' => 'Атрибут {attribute} "{value}" уже занят.',
  '{attribute} "{value}" is invalid.' => 'Значение {attribute} "{value}" неверно.',
  '{attribute} cannot accept more than {limit} files.' => '{attribute} не может принять более {limit} файлов.',
  '{attribute} cannot be blank.' => 'Атрибут {attribute} не должен быть пустым.',
  '{attribute} is invalid.' => 'Атрибут {attribute} не верен.',
  '{attribute} is not a valid URL.' => 'Атрибут {attribute} не является правильным URL.',
  '{attribute} is not a valid email address.' => 'Атрибут {attribute} не является правильным E-Mail адресом.',
  '{attribute} is not in the list.' => 'Атрибут {attribute} отсутствует в списке.',
  '{attribute} is of the wrong length (should be {length} characters).' => 'Атрибут {attribute} неверной длины (Должен быть {length} симв.).',
  '{attribute} is too big (maximum is {max}).' => 'Атрибут {attribute} слишком велик (Максимум: {max}).',
  '{attribute} is too long (maximum is {max} characters).' => 'Атрибут {attribute} слишком длинный (Максимум: {max} симв.).',
  '{attribute} is too short (minimum is {min} characters).' => 'Атрибут {attribute} слишком короткий (Минимум: {min} симв.).',
  '{attribute} is too small (minimum is {min}).' => 'Атрибут {attribute} слишком мал (Минимум: {min}).',
  '{attribute} must be a number.' => 'Атрибут {attribute} должен быть числом.',
  '{attribute} must be an integer.' => 'Атрибут {attribute} должен быть целым числом.',
  '{attribute} must be either {true} or {false}.' => 'Значение {attribute} должно быть {true} или {false}.',
  '{attribute} must be greater than "{compareValue}".' => 'Значение {attribute} должно быть больше "{compareValue}".',
  '{attribute} must be greater than or equal to "{compareValue}".' => 'Значение {attribute} должно быть больше или равно "{compareValue}".',
  '{attribute} must be less than "{compareValue}".' => 'Значение {attribute} должно быть меньше "{compareValue}".',
  '{attribute} must be less than or equal to "{compareValue}".' => 'Значение {attribute} должно быть меньше или равно "{compareValue}".',
  '{attribute} must be repeated exactly.' => 'Атрибут {attribute} должен быть повторен в точности.',
  '{attribute} must be {type}.' => 'Атрибут {attribute} должен быть {type}.',
  '{attribute} must be {value}.' => 'Значение {attribute} должно быть равно {value}.',
  '{attribute} must not be equal to "{compareValue}".' => 'Значение {attribute} не должно быть равно {value}.',
  '{className} does not support add() functionality.' => 'Класс {className} не поддерживает функционал add().',
  '{className} does not support delete() functionality.' => 'Класс {className} не поддерживает функционал delete() .',
  '{className} does not support flush() functionality.' => 'Класс {className} не поддерживает функционал flush().',
  '{className} does not support get() functionality.' => 'Класс {className} не поддерживает функционал get().',
  '{className} does not support set() functionality.' => 'Класс {className} не поддерживает функционал set().',
  '{class} does not have a method named "{name}".' => 'Класс {class} не содержит метода "{name}".',
  '{class} does not have relation "{name}".' => 'Класс {class} не содержит отношения "{name}".',
  '{class} does not support fetching all table names.' => 'Класс {class} не поддерживает выборку имён всех таблиц.',
  '{class} has an invalid validation rule. The rule must specify attributes to be validated and the validator name.' => 'Класс {class} содержит неверное правило проверки (validation rule). Правило должно иметь имя и включать элементы для проверки.',
  '{class} must specify "model" and "attribute" or "name" property values.' => 'В классе {class} должны быть определены значения свойств "model" и "attribute", либо "name".',
  '{class}.allowAutoLogin must be set true in order to use cookie-based authentication.' => 'Для использования авторизации, построенной на cookie, свойство {class}.allowAutoLogin должно принять значение "true".',
  '{class}::authenticate() must be implemented.' => 'Требуется определить метод {class}::authenticate().',
  '{controller} cannot find the requested view "{view}".' => 'Контроллер {controller} не может найти представление (view) "{view}".',
  '{controller} contains improperly nested widget tags in its view "{view}". A {widget} widget does not have an endWidget() call.' => 'Контроллер {controller} содержит в своем представлении (view) "{view}" тэги виджетов с неправильной вложенностью. В виджете (widget) {widget} не используется вызов endWidget().',
  '{controller} has an extra endWidget({id}) call in its view.' => 'В представлении (view) контроллера {controller} обнаружен лишний вызов endWidget({id}).',
  '{widget} cannot find the view "{view}".' => 'Виджет {widget} не может найти представление (view) "{view}".',
);
