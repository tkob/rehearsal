# List.@

```
# [1,2,3] @ [4,5,6];
val it = [1,2,3,4,5,6] : int list
```

# List.@ left identity

```
# [] @ [1,2,3];
val it = [1,2,3] : int list
```

# List.@ right identity

```
# [1,2,3] @ [];
val it = [1,2,3] : int list
```

# multi-line

```
# val v =
> 1;
val v = 1 : int
```

# Tutorial

```
# 10;
val it = 10 : int
# 0xA;
val it = 10 : int
# ~0xFF;
val it = ~255 : int
```

```
# 10 + 0xA;
val it = 20 : int
# 0 - 0xA;
val it = ~10 : int
# 10 div 2;
val it = 5 : int
# 10 * 2;
val it = 20 : int
```

```
# 1 + 2 * 3;
val it = 7 : int
# 4 - 3 - 2;
val it = ~1 : int
```

```
# 10.0;
val it = 10.0 : real
# 1E2;
val it = 100.0 : real
# 0.001;
val it = 0.001 : real
# ~1E~2;
val it = ~0.01 : real
# 10;
val it = 10 : int
```

```
# 10.0 + 1E1;
val it = 20.0 : real
# 10.0 / 2.0;
val it = 5.0 : real
# 10.0 * 2.0;
val it = 20.0 : real
```

```
# #"a";
val it = #"a" : char
# #"\n";
val it = #"\n" : char
```

```
# ord #"a";
val it = 97 : int
# chr(97 + 7);
val it = #"h" : char
# ord #"a" - ord #"A";
val it = 32 : int
# chr(ord #"H" + 32);
val it = #"h" : char
```

```
# "SML#" ^ "\n";
val it = "SML#\n" : string
# print it;
SML#
val it = () : unit
```

```
# 0w10;
val it = 0xA : word
# 0wxA;
val it = 0xA : word
```

```
# 1 < 2;
val it = true : bool
# 1 < 2 andalso 1 > 2;
val it = false : bool
# 1 < 2 orelse 1 > 2;
val it = true : bool
```

```
# if 1 < 2 then 1 else 2;
val it = 1 : int
```

```
# (if 1 < 2 then 1 else 2) * 10;
val it = 10 : int
```

```
# fun S(n) = (n * (n + 1) * (2*n + 1)) div 6;
val S = fn : int -> int
```

```
# S 10;
val it = 385 : int
# S 20;
val it = 2870 : int
```

```
# fun fact 0 = 1
>   | fact n = n * fact (n - 1);
val fact = fn : int -> int
```

```
# fun powerUncurry (0,C) = 1
>   | powerUncurry (n,C) = C * powerUncurry(n - 1,C);
val powerUncurry = fn : int * int -> int
# powerUncurry (2,3);
val it = 9 : int
# fun powerCurry 0 C= 1
>   | powerCurry n C = C * (powerCurry (n - 1) C);
val powerCurry = fn : int -> int -> int
# powerCurry 2 3;
val it = 9 : int
```

```
# fun Sigma f 0 = 0
>   | Sigma f n = f n + Sigma f (n - 1);
val Sigma = fn : (int -> int) -> int -> int
```

```
# val x = ref 1;
val x = ref 1 : int ref
# !x;
val it = 1 : int
# x := 2;
val it = () : unit
# !x;
val it = 2 : int
```

```
# [1,2,3];
val it = [1,2,3] : int list
```

```
# 1::2::3::nil;
val it = [1,2,3] : int list
```

```
# op ::;
val it = fn : ['a. 'a * 'a list -> 'a list]
```

```
# fun cons e L = e :: L;
val cons = fn : ['a. 'a -> 'a list -> 'a list]
```

```
# fun twice f x = f (f x);
val twice = fn : ['a. ('a -> 'a) -> 'a -> 'a]
```

```
# val point = {X =0.0, Y=0.0};
val point = {X = 0.0,Y = 0.0} : {X: real, Y: real}
```

```
# {1 = 1.1, 2 = fn x => x + 1, 3 = "SML#"};
val it = (1.1,fn,"SML#") : real * (int -> int) * string
# (1,2);
val it = (1,2) : int * int
```

```
# fun f x y = {X=x, Y=y};
val f = fn : ['a. 'a -> ['b. 'b -> {X: 'a, Y: 'b}]]
# fun g x y = (x,y);
val g = fn : ['a. 'a -> ['b. 'b -> 'a * 'b]]
```

```
# #X;
val it = fn : ['a#{X: 'b}, 'b. 'a -> 'b]
```

```
# #X {X=1.1, Y=2.2};
val it = 1.1 : real
```

```
# fun f {X=x,Y=y} = (x,y);
val f = fn : ['a, 'b. {X: 'a, Y: 'b} -> 'a * 'b]
# fun f {X=x,Y=y,...} = (x,y);
val f = fn : ['a#{X: 'b, Y: 'c}, 'b, 'c. 'a -> 'b * 'c]
# fun f {X,Y,...} = (X,Y);
val f = fn : ['a#{X: 'b, Y: 'c}, 'b, 'c. 'a -> 'b * 'c]
```

```
# fun f ({X,...}::_) = X;
...
val f = fn : ['a#{X: 'b}, 'b. 'a list -> 'b]
```

```
# fun reStructure (p as {Salary,...}) = p # {Salary=Salary * (1.0 - 0.0803)};
val reStructure = fn : ['a#{Salary: real}. 'a -> 'a]
```

```
# fn self => fn x => self := (!self # {X = x});
val it = fn : ['a#{X: 'b}, 'b. 'a ref -> 'b -> unit]
```

```
# val myCPoint = fn M => #CPoint M {X=1.0, Y = 1.0};
val myCPoint = fn : ['a#{CPoint: {X: real, Y: real} -> 'b}, 'b. 'a -> 'b]
# val myPPoint = fn M => #PPoint M {r=1.41421356, theta = 45.0 };
val myPPoint = fn : ['a#{PPoint: {r: real, theta: real} -> 'b}, 'b. 'a -> 'b]
```

```
# fun f x y = (x,y);
val f = fn : ['a. 'a -> ['b. 'b -> 'a * 'b]]
```

```
# f 1;
val it = fn : ['a. 'a -> int * 'a]
# it "ML";
val it = (1,"ML") : int * string
```

```
# val puts = _import "puts" : string -> int;
val puts = fn : string -> int
# puts "My first call to a C library";
My first call to a C library
val it = 29 : int
# map puts ["I","became","fully","operational","in","April","2nd","2012."];
I
became
fully
operational
in
April
2nd
2012.
val it = [2,7,6,12,3,6,4,6] : int list
```

