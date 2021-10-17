
func main() -> Int32 {
    let cat: ref<Pet> = new Cat();
    Log(cat.make_a_sound());

    for i in [0, 1, 2, 3, 4] {
        Log(ToString(i));
    }
    return fib(16);
}

func fib(n: Int32) -> Int32 {
    if n == 0 {
        return 0;   
    }
    if n == 1 {
        return 1;
    }
    return fib(n - 1) + fib(n - 2);
}

abstract class Pet {
    let age: Int32;

    func make_a_sound() -> String

    func get_age() -> Int32 = this.age
}

class Cat extends Pet {
    func make_a_sound() -> String = "Meow"
}
