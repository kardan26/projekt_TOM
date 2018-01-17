clc
clear all
close all

choice=menu({'Welcome!';' Please select your solution'},'2 equation, 2 unknown', 'Additive ART','Multiadditive ART', ...
' 3 equation, 2 unknown', '2 equation, 3 unknown');

% 2 r�wnania 2 niewiadome

A = [ 5.05 0.5; 0.1 1];
G = [8.5; 2];
F = A\G;
FP = pinv(A)*G; % pseudoodwrotno��

x = 0.9:0.1:2;
y2 = (-A(1,1)*x+G(1))/A(1,2);
y1 = (-A(2,1)*x+G(2))/A(2,2);

        
switch choice
    case 1
        % Rysowanie wykresu

        figure;
        plot(x, y1, x, y2, F(1,1), F(2,1), 'ko')
        axis([0.9 2 0.9 2])
        grid on
        grid minor

    case 2
        %% Additive ART

        F1 = [1; 1];
        lambda = 1;
        k1 = 1;
        l1 = 1;
        ROZW1(k1,:) = F1;
        k1=k1+1;
        for i=1:1:5
            for j=1:1:size(F1,1)
                f1_1 = F1 + (lambda * ((G(j) - (A(j,:)) * F1) / (A(j,:) * A(j,:)')) * A(j,:)');
                blad1(l1,j) = G(j) - (A(j,:) * F1);
                F1 = f1_1;
                ROZW1(k1,:) = F1;
                k1=k1+1;
            end
            l1=l1+1;
        end

        iteracje = 1:1:(l1-1);
        F1;
        blad1;
        ROZW1;

        % Rysowanie wykresu
        screenSize = get(groot,'ScreenSize');
        windowHigh = screenSize(4);
        windowSize = screenSize;
        windowSize(4) = windowHigh * 0.9;
        figure('Name','Algorytm Additive ART','pos',windowSize);
        subplot(1,2,1)
         plot(x, y1, x, y2, ROZW1(:,1),ROZW1(:,2), 'ko--')
         axis('square')
         axis([0.9 2 0.9 2])
         set(0, 'defaultTextFontSize',10);
         text(0.9,0.65,'Punkt startowy (1, 1)')
         T = {'Ortogonalne rzutowanie punktu na proste'; 
         'odpowiadaj�ce dw�m r�wnaniom';
         'uk�adu z dwiema niewiadomymi'};
         title(T)
         xlabel('x')
         ylabel('y')
         grid on
         grid minor
        subplot(1,2,2)
         semilogy(iteracje, abs(blad1(:,1)), 'x-.');
         axis('square')
%          axis([1 (l1-1) -1 (l1-3)])
         title('B��d oszacowania i-tej iteracji');
         set(0, 'defaultTextFontSize',16);
         text(1.5,5,'Algorytm additive ART')
         xlabel('i')
         ylabel('b��d')
         grid on
         grid minor
         
         hold on;
         semilogy(iteracje, abs(blad1(:,2)), 'rx-.');
         hold off;
         legend('r�wnanie nr 1','r�wnanie nr 2');
%         subplot(1,3,3)
% 
%          axis('square')
%          axis([1 (l1-1) -1 (l1-3)])
%          T = {'B��d oszacowania i-tej iteracji'};
%          title(T)
%          xlabel('iteracje')
%          ylabel('b��d')
%          grid on
%          grid minor
        % subplot(2,3,4)
        %  z = zeros(1,size(x,2));
        %  zet = zeros(size(ROZW1,1),1);
        %  plot3(x,y1,z, x,y2,z, ROZW1(:,1),ROZW1(:,2),zet, 'ko--')
        %  axis('square')
        %  axis([0.9 2 0.9 2])
        %  grid on
        %  grid minor


    case 3
%% Multiadditive ART
        F2 = [1.5; 1.5];
        p = 0.8;
        blad2 = [0; 0];
        k2 = 1;
        ROZW2(k2,:) = F2;
        k2=k2+1;
        for i=1:1:10
            for j=1:1:size(F2,1)
                f2_1 = F2(j,1) * (G(j,1) / (A(j,:) * F2)) ^ p;
                blad2(j,1) = G(j,1) - (A(j,:) * F2);
                F2(j,1) = f2_1;
            end
            ROZW2(k2,:) = F2;
            k2=k2+1;
        end

        F2;
        blad2;
        ROZW2;

        % % Rysowanie wykresu
        figure;
        plot(x, y1, x, y2, ROZW2(:,1),ROZW2(:,2), 'ko--')
        axis([1.4 2 1.4 2])
        grid on
        grid minor

%% Pytania:
% Czy ja te rozwi�zania w dobrym miejscu wpisuj� do puli rozwi�za�?
% Wydaje mi si�, �e dobrze, bo pierwsza AA ART wykonuje od razu zmian� 
% x i y, a MART wykonuje najpierw x a w nast�pnym kroku dopiero y

% Jak zrobi� 2 r�wnania i 3 niewiadome??
% Jaki jest z??
%% 3 r�wnania 2 niewiadome
    case 4
        AA = [5.05 0.5; 0.1 1; 2 1];
        GG = [8.8421; 1.9721; 4.3452];
        FF = AA\GG; % r�wnanie jest sprzeczne. FF to rozwi�zanie �redniokwadratowe

        % rysowanie wykresu
        xx = 1:0.01:2;
        yy1 = (-(AA(1,1))*xx+GG(1,1))/AA(1,2);
        yy2 = (-(AA(2,1))*xx+GG(2,1))/AA(2,2);
        yy3 = (-(AA(3,1))*xx+GG(3,1))/AA(3,2);

        figure;
        plot(xx, yy1, xx, yy2, xx, yy3, FF(1,1), FF(2,1), 'ko')
        grid on
        grid minor

%% 2 r�wnania 3 niewiadome
    case 5
        %AAA = [5.05 0.5 1; 0.1 1 2]; %wychodzi �le
        AAA = [5.05 0.5 2; 0.1 1 1]; %wychodzi dobrze
        GGG = [8.5; 2];
        FFF = AAA\GGG;

        % rysowanie wykresu
        xxx = 1:0.01:2;
        zzz = 1:0.01:2;
        yyy1 = ((-(AAA(1,1))*xxx) + (-(AAA(1,3))*xxx) + GGG(1,1)) / AAA(1,2);
        yyy2 = ((-(AAA(2,1))*xxx) + (-(AAA(2,3))*xxx) + GGG(2,1)) / AAA(2,2);

%         figure; 
%         mesh(xxx, yyy1, zzz)
%         mesh(xxx, yyy1, z??, xxx, yyy2, z??, FFF(1,1), FFF(2,1), FFF(3,1), 'ko')
%         grid on
%         grid minor

end 