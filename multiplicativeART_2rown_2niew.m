function [ ] = multiplicativeART_2rown_2niew(A,G,F,x)
%UNTITLED3 Summary of this function goes hereinput_args
%   Detailed explanation goes here
y = calc2(A,G,x);


        F2 = [1.5; 1.5];
        p = 0.8;
        blad2 = [0; 0];
        ROZW2(1,:) = F2;
        for i=1:1:10
            for j=1:1:size(F2,1)
                f2_1 = F2(j,1) * (G(j,1) / (A(j,:) * F2)) ^ p;
                blad2(i,j) = G(j,1) - (A(j,:) * F2);
                F2(j,1) = f2_1;
            end
            ROZW2(i+1,:) = F2;
        end
        iteracje2 = 1:i;
       
        % Rysowanie wykresu
        screenSize = get(groot,'ScreenSize');
        windowHigh = screenSize(4);
        windowSize = screenSize;
        windowSize(4) = windowHigh * 0.9;
        figure('Name','Algorytm Multiplicative ART','pos',windowSize);

        subplot(1,2,1)
         plot(x, y(1,:),'b');
         hold on;
         plot(x, y(2,:), 'r');
         plot(ROZW2(:,1),ROZW2(:,2), 'ko--');
         hold off;
         axis('square')
         axis([0.9 2 0.9 2])
         set(0, 'defaultTextFontSize',10);
         text(1.5,1.5,'Punkt startowy (1,5, 1,5)  ','HorizontalAlignment', 'right')
         T = {'Zabaczymy jaki tytul '};
         title(T)
         xlabel('x')
         ylabel('y')
         grid on
         grid minor
         
        subplot(1,2,2)
         semilogy(iteracje2, abs(blad2(:,1)), 'x-.');
         axis('square')
         title('B��d oszacowania i-tej iteracji');
         xlabel('i')
         ylabel('b��d')
         grid on
         grid minor
         
         hold on;
         semilogy(iteracje2, abs(blad2(:,2)), 'rx-.');
         hold off;
         legend('r�wnanie nr 1','r�wnanie nr 2');
         
         text(-0.2,1.2, 'Algorytm multiplicative ART', 'HorizontalAlignment', 'center',...
            'FontSize', 16 , 'Units', 'normalized');
end
