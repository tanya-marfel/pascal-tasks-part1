(*
 * Project: labs
 * User: tatsianamarfel
 * Date: 5/20/18
 *)
PROGRAM practice1;

Uses Crt;

Const
  eps1 = 0.01;
    { Точность 10-2}
  eps2 = 0.001;
    { Точность 10-3 }
  eps3 = 0.0001;
    { Точность 10-4 }
  a = -0.6;
    { Начальное значение Х}
  b = 0.05;
    { Шаг}
  N = 20; { Количество значений функции }

Var
    {Вспомогательные переменные}
  k1, k2, k3, i : integer;
  f1, f2_1, f2_2, f2_3, step, add, x : Real;

BEGIN
  ClrScr;
{Рисуется шапка таблицы}
  writeln('__________________________________________________________');
  writeln('|       |             |  e=0.01  |  e=0.001  |  e=0.0001  |');
  writeln('|   x   |     f1(x)   |----------|-----------|------------|');
  writeln('|       |             | f2(x)| N | f2(x) | N | f2(x)  | N |');
  writeln('|_______|_____________|______|___|_______|___|________|___|');
  x := a; {Начальное значение Х}
  for i:=1 to N do
  begin
    f1 := (x / 2) + (sqr(x) / 4) + ((1 / 2) * (1 - sqr(x)) * (ln(1 - x))); { Вычисляется значение функции f1}

{ Вычисляется значения функции f2}
    k1 := 0;
    step := x * x; {Начальное значение степени Х}
    f2_1 := 0; {Начальное значение функции f2_1}
    repeat {Итерационный цикл для точности 10-2}
      inc(k1);
      step := step * x; {Наращивается степень}
      add := step / (k1 * (k1 + 2)); {Считается очередное слагаемое}
      f2_1 := f2_1 + add; {Считается значение f2_1}
    until abs(add) <= eps1; {Выход из цикла, когда слагаемое становится меньше точности 10-2}
    f2_2 := f2_1;
    k2 := k1;
    repeat {Итерационный цикл для точности 10-3}
      inc(k2);
      step := step * x; {Наращивается степень}
      add := step / (k2 * (k2 + 2)); {Считается очередное слагаемое}
      f2_2 := f2_2 + add;
    until abs(add) <= eps2; {Выход из цикла, когда слагаемое становится меньше точности 10-3}
    f2_3 := f2_2;
    k3 := k2;
    repeat {итерационный цикл для точности 10-4}
      inc(k3);
      step := step * x; {Наращивается степень}
      add := step / (k3 * (k3 + 2)); {Считается очередное слагаемое}
      f2_3 := f2_3 + add;
    until abs(add) <= eps3; {Выход из цикла, когда слагаемое становится меньше точности 10-4}
{ Вывод результатов}
    writeln('| ', x: 5 : 2, ' | ', f1: 12 : 9, '| ', f2_1: 5 : 3, '| ',
             k1: 2, '| ', f2_2: 6 : 3, '| ', k2: 2, '| ', f2_3: 7 : 4, '| ', k3: 2, '|');
    x := x + b;
  end;
{ завершение таблицы }
  write('-----------------------------------------------------------');
  ReadKey
END.