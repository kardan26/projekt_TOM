clc
clear all
close all
choice1=menu({' Wybierz uk�ad r�wna�, kt�ry chcesz rozwi�za�'}, 'Dwa r�wnania, dwie niewiadome','Trzy r�wnania, dwie niewiadome', 'Dwa r�wnania, trzy niewiadome');


% 2 r�wnania 2 niewiadome

switch choice1
    case 1 %Dwa r�wnania, dwie niewiadome
        A = [ 5.05 0.5; 0.1 1];
        G = [8.5; 2];
        F = A\G;
        FP = pinv(A)*G; % pseudoodwrotno��

        x = 0.9:0.1:2;
        choice2=menu({' Wybierz metod� rozwi�zania'}, 'Additive ART','Multiplicative ART ART');
        switch choice2
            case 1 % additive ART
                additiveART_2rown_2niew( A,G,F,x,10^(-9));
            case 2 % multiadditiveART
                multiplicativeART_2rown_2niew(A,G,F,x,10^-9);    
        end
        
    case 2 %trzy r�wnania, dwie niewiadome
        clear all;
        A = [5.05 0.5; 0.1 1; 2 1];
        G = [8.8421; 1.9721; 4.3452];
        F = A\G; % r�wnanie jest sprzeczne. FF to rozwi�zanie �redniokwadratowe
        
        % rysowanie wykresu
        x = 1:0.5:2;
        y = calc2(A,G,x);
        
        figure;
        plot(x, y(1,:), x, y(2,:), x, y(3,:), F(1,1), F(2,1), 'ko')
        grid on
        grid minor
    case 3 %dwa r�wnania, trzy niewiadome
        %AAA = [5.05 0.5 1; 0.1 1 2]; %wychodzi �le
        clear all;
        A = [5.05 0.5 2; 0.1 1 1]; %wychodzi dobrze
        G = [8.5; 2];
        F = A\G;

        % rysowanie wykresu
        x = 1:0.01:2;
        z = zeros(size(x));
        y = calc3d(A,G,x);

        figure; 
        plot3(x, y(1,:), z);
        hold on;
        plot3(x, y(2,:), z);
        hold off;
%         mesh(xxx, yyy1, z??, xxx, yyy2, z??, FFF(1,1), FFF(2,1), FFF(3,1), 'ko')
        grid on
        grid minor
end
    
% Pytania:
% Czy ja te rozwi�zania w dobrym miejscu wpisuj� do puli rozwi�za�?
% Wydaje mi si�, �e dobrze, bo pierwsza AA ART wykonuje od razu zmian� 
% x i y, a MART wykonuje najpierw x a w nast�pnym kroku dopiero y

% Jak zrobi� 2 r�wnania i 3 niewiadome??
% Jaki jest z??h


% %% 2 r�wnania 3 niewiadome
% 


