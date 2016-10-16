function [] = aplicatie_4()
    fplot(@(x) x^2 - x + 1,[-1 1],'b')
    hold on
    fplot(@(x) 2*x + 3,[1 3],'b')
    hold off
end

