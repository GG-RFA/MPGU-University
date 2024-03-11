# Импортируем из модуля "http.server" модули "BaseHTTPRequestHandler" и "HTTPServer" для работы с запросами и серверами
from http.server import BaseHTTPRequestHandler, HTTPServer
# Импортируем модуль "time" для работы со временем
import time

# Объявляем переменную для имени хоста
hostName = "localhost"
# Объявляем переменную для номера порта
serverPort = 8080

# Реализуем класс "MyServer" для работы с сервером
class MyServer(BaseHTTPRequestHandler):
    def do_GET(self):
        # Реализуем отправку ответа с кодом 200 (OK)
        self.send_response(200)
        # Указываем тип контента как HTML
        self.send_header("Content-type", "text/html")
        # Завершаем заголовки ответа
        self.end_headers()
        # Задаём начало HTML-страницы с указанием кодировки
        self.wfile.write(bytes("<!DOCTYPE html><html lang='ru'><head><meta charset='utf-8'/><title>Веб-сервер</title></head>", "utf-8"))
        # Задаём начало тела HTML страницы
        self.wfile.write(bytes("<body>", "utf-8"))
        # Выводим текст
        self.wfile.write(bytes("<h1>Добро пожаловать на сервер!</h1>", "utf-8")) 
        self.wfile.write(bytes("<p>Инструкция по работе с сервером при обращении к нему:</p>", "utf-8")) 
        self.wfile.write(bytes("<ol>", "utf-8")) 
        self.wfile.write(bytes("<li>При запуске программа слушает заданный порт (8080) на заданном хосте (localhost). </li>", "utf-8")) 
        self.wfile.write(bytes("<li>Клиентской программой является браузер, который при обращении к серверу выводит html-текст, отправляемый сервером при обращении к нему по заданному порту.</li>", "utf-8")) 
        self.wfile.write(bytes("</ol>", "utf-8")) 
        # Завершаем HTML страницу
        self.wfile.write(bytes("</body></html>", "utf-8"))

# Проверяем, что скрипт запущен как основной
if __name__ == "__main__":
    # Создаём HTTP-сервер на указанном хосте и порте
    webServer = HTTPServer((hostName, serverPort), MyServer)
    # Выводим сообщение о запуске сервера
    print("Сервер запущен! Его адрес следующий: http://%s:%s" % (hostName, serverPort))
    
    try:
        # Реализуем бесконечный запуск сервера
        webServer.serve_forever()
    except KeyboardInterrupt:
        pass
    # Реализуем закрытие сервера
    webServer.server_close()
    # Выводим сообщение о завершении работы сервера
    print("Сервер остановлен.")