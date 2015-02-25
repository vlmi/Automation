class CoffeeMachine  # создаем объект-класс
def make_coffee
 puts "Готовим воду и зёрна"
 puts "Варим и наливаем кофе"
 end
 end

saeco = CoffeeMachine.new  # создаем экземпляр класса (включаем конвейер)

saeco.make_coffee
CoffeeMachine.make_coffee


class CappuccinoMachine < CoffeeMachine
  def create_foam
    prepare_milk
    push_foam
  end

  private

  def prepare_milk
    puts "Отбираем и кипятим молоко"
  end

  def push_foam
    puts "Выпускаем молочную пенку в чашку"
  end
end