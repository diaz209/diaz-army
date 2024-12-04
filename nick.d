задние 1:
class Pet:
    def __init__(self, name, species, age=0, hunger=50, happiness=50):
        self.name = name
        self.species = species
        self.age = age
        self.hunger = hunger  # Уровень голода (0 - сыт, 100 - голодный)
        self.happiness = happiness  # Уровень счастья (0 - несчастен, 100 - счастлив)

    def feed(self):
        self.hunger = max(0, self.hunger - 20)
        print(f"{self.name} покушал. Уровень голода: {self.hunger}")

    def play(self):
        if self.hunger < 80:
            self.happiness = min(100, self.happiness + 20)
            self.hunger += 10
            print(f"{self.name} поиграл. Уровень счастья: {self.happiness}")
        else:
            print(f"{self.name} слишком голоден, чтобы играть.")

    def status(self):
        print(f"{self.name} (вид: {self.species}) - Голод: {self.hunger}, Счастье: {self.happiness}")


class Human:
    def __init__(self, name):
        self.name = name

    def interact_with_pet(self, pet, action):
        if action == "feed":
            pet.feed()
        elif action == "play":
            pet.play()
        else:
            print(f"{self.name} не знает, что делать с {pet.name}.")

kitty = Pet(name="Мурка", species="Кот")
owner = Human(name="Анна")

kitty.status()
owner.interact_with_pet(kitty, "feed")
owner.interact_with_pet(kitty, "play")
kitty.status()

задание 2: 

class Farmer:
    def __init__(self, name):
        self.name = name
        self.energy = 100  

    def work(self, crop):
        if self.energy >= 20:
            self.energy -= 20
            crop.grow()
            print(f"{self.name} поработал на поле. Энергия: {self.energy}")
        else:
            print(f"{self.name} слишком устал, чтобы работать.")

    def rest(self):
        self.energy = min(100, self.energy + 30)
        print(f"{self.name} отдохнул. Энергия: {self.energy}")


class Crop:
    def __init__(self, crop_type, growth=0):
        self.crop_type = crop_type
        self.growth = growth  # Уровень роста урожая (0-100)

    def grow(self):
        self.growth = min(100, self.growth + 20)
        print(f"{self.crop_type} подрос. Уровень роста: {self.growth}")

    def status(self):
        print(f"{self.crop_type} - Уровень роста: {self.growth}")

farmer = Farmer(name="Иван")
wheat = Crop(crop_type="Пшеница")

for day in range(1, 6):  # Имитация 5 дней
    print(f"\nДень {day}:")
    if farmer.energy < 30:
        farmer.rest()
    else:
        farmer.work(wheat)
    wheat.status()
