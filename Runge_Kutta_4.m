function [X,Y,y,Error] = Runge_Kutta_4(a,b,h,f,y,resolve)
%Решение ду методом Рунге-Кутта 4 порядка
i=0;
%Задаем цикл по сетке 
for x=a:h:b
  i=i+1;
  %Решение ду методом РК-4
  F1=f(x,y(i));
  F2=f(x+0.5*h,y(i)+0.5*h*F1);
  F3=f(x+0.5*h,y(i)+0.5*h*F2);
  F4=f(x+h,y(i)+h*F3);
  y(i+1) = y(i) + (h/6)*(F1+2*F2+2*F3+F4);
  %Аналитическое решение решения ду y'=2*x*y
  Y(i)=resolve(x);
  X(i)=x;
  %Вычисляем погрешность,как модуль разности аналитического решения и решения методом Рунге-Кутты 4 порядка
  Error(i)=abs(Y(i)-y(i));
  
end 
end

