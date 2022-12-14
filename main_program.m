%Это основной файл программы,в файлах
%Runge_Kutta_1.m,Runge_Kutta_2.m,Runge_Kutta_4.m храняться функции,где
%прописаны алгоритмы соответствующих методов
%==========================================================================
clc
clear 
close all

%y'=2*x*y Дифференциальное уравнеие,которое мы хотим решить 
f=@(x,y) 2*x*y; 
%Аналитическое решение данного дифференциального уравнения
resolve=@(x) exp(x^2); 

%Задаем параметры сетки
a=0;
b=1;
n=100;

%Значение шага h
h=(b-a)/n;

%Начальные условия ДУ
y(1)=1;


%Создание меню программы
r = menu ( ' Выберете порядок метода', ...
 ' Рунге-Кутты 1 '  , ' Рунге-Кутты 2 '  , ' Рунге-Кутты 4 ');
 
switch r 
    
 %В первом case пропишу решение ду методом Рунге-Кутты 1 порядка
 case 1   
%Для этого вызову функцию Runge_Kutta_1 для решения дифференциального уравнения
%методом РК-1/Эйлера
[X,Y,y,Error] = Runge_Kutta_1(a,b,h,f,y,resolve);

%Строю график аналитического решения дифференциального уравнения
%+график решения методом Рунге-Кутта 1 порядка
plot(X,Y,X,y(1:n+1),'k.')
legend('Аналитическое решение','Решение ДУ методом Рунге-Кутта 1 порядка')
grid on 
title('Рунге-Кутта 1')

%Добавляю график,где видна погрешность метода Рунге-Кутты 1 
figure
plot(X,Error)
legend('Error RK1')
grid on
   
%Во втором case пропишу решение ду методом Рунге-Кутты 2 порядка
case 2 
%Вызываю функцию Runge_Kutta_2 для решения дифференциального уравнения
%методом РК-2
[X,Y,y,Error] = Runge_Kutta_2(a,b,h,f,y,resolve);

%Строю график аналитического решения дифференциального уравнения
%+график решения методом Рунге-Кутта 2 
plot(X,Y,X,y(1:n+1),'k.')
legend('Аналитическое решение','Решение ДУ методом Рунге-Кутта 2 порядка')
grid on 
title('Рунге-Кутта 2')

%Добавляю график,где видна погрешность метода Рунге-Кутты 2 порядка
figure
plot(X,Error)
legend('Error RK2')
grid on
 
case 3   
%В третьем case пропишу решение методом Рунге-Кутты 4 порядка
%Для этого вызову функцию Runge_Kutta_4 для решения дифференциального уравнения
%методом РК-4
[X,Y,y,Error] = Runge_Kutta_4(a,b,h,f,y,resolve);

%Строю график аналитического решения дифференциального уравнения
%+график решения методом Рунге-Кутта 4 порядка
plot(X,Y,X,y(1:n+1),'k.')
legend('Аналитическое решение','Решение ДУ методом Рунге-Кутта 4 порядка')
grid on 
title('Рунге-Кутта 4')

%Добавляю график,где видна погрешность метода Рунге-Кутты 4 порядка
figure
plot(X,Error)
legend('Error RK4')
grid on
 
end
 

 
