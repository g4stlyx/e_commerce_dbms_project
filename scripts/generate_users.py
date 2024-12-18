import random
import datetime

male_names = ["Mustafa", "Ahmet", "Ali", "Hüseyin", "Hasan", "İsmail", "Mehmet", "Osman", "Yusuf", "Murat", "Ömer", "Ramazan", "Süleyman", "Abdullah", "Mahmut", "Recep", "Salih", "Fatih", "Kadir", "Emre", "Hakan", "Adem", "Kemal", "Yaşar", "Bekir", "Musa", "Metin", "Bayram", "Serkan", "Orhan", "Burak", "Furkan", "Gökhan", "Yasin", "Uğur", "Yakup", "Muhammed", "Şükrü", "Cemal", "Enes", "Yunus", "Arif", "Onur", "Muhammet", "Yılmaz", "Halil", "İbrahim"]
female_names = ["Ece", "Zeynep", "Elif", "Selma", "Zehra", "Sultan", "Hanife", "Merve", "Zeliha", "Esra", "Fadime", "Özlem", "Yasemin", "Melek", "Rabia", "Hülya", "Cemile", "Sevim", "Gülsüm", "Leyla", "Dilek", "Büşra", "Aysel", "Songül", "Kübra", "Esma", "Aynur", "Hayriye", "Kadriye", "Tuğba", "Sevgi", "Rukiye", "Havva", "Sibel", "Derya", "Asiye", "Filiz", "Kezban", "Ebru", "Ayşegül"]
last_names = ["Yılmaz", "Kaya", "Demir", "Şahin", "Çelik", "Öztürk", "Aydın", "Arslan", "Doğan", "Kılıç"] # Add more as needed
cities = ["İstanbul", "Ankara", "İzmir", "Bursa", "Adana", "Trabzon", "Giresun", "Samsun"]
jobs = ["engineer", "doctor", "accountant", "waiter", "nurse", "architect", "designer", "police officer", "lawyer", "dentist", "vet"]

sql = "INSERT INTO users (username, password, first_name, middle_initial, last_name, birth_date, is_admin, email, phone_number, gender, job, address) VALUES\n"

for i in range(92):
    first_name = male_names[i % len(male_names)] if i < 46 else female_names[i % len(female_names)]
    last_name = last_names[i % len(last_names)]
    username = (first_name + "_" + last_name).replace("İ", "I").replace("ı", "i").replace("Ş", "S").replace("ş", "s").replace("Ç", "C").replace("ç", "c").replace("Ü", "U").replace("ü", "u").replace("Ö", "O").replace("ö", "o").replace("Ğ", "G").replace("ğ", "g") # Remove Turkish characters
    middle_initial = chr(65 + (i % 26))
    birth_date = (datetime.date(1964, 1, 1) + datetime.timedelta(days=random.randint(0, 39*365))).strftime("%Y-%m-%d")
    email = f"user{i+9}@example.com"
    phone_number = str(random.randint(5000000000, 5999999999)) # Example phone number range
    gender = 'M' if i < 46 else 'F'
    job = jobs[i % len(jobs)]
    city = cities[i % len(cities)]


    sql += f"('{username}', 'password123', '{first_name}', '{middle_initial}', '{last_name}', '{birth_date}', 0, '{email}', '{phone_number}', '{gender}', '{job}', '{city}'),\n"



sql = sql[:-2] + ";\n" # Remove last comma and add semicolon
print(sql)