%% Velocity - given a, b, w2, tk {k e N | [2, 3, 4]}
set(0, 'DefaultTextInterpreter', 'Latex')

w3v = linspace(0,1,N)';
w4v = linspace(0,1,N)';

for iter = 1:length(w3v)
    w3v(iter) = (a*w2*sin(t4v(iter) - t2v(iter)))/(b*sin(t3v(iter) - t4v(iter)));
    w4v(iter) = (a*w2*sin(t2v(iter) - t3v(iter)))/(c*sin(t4v(iter) - t3v(iter)));
end

clear iter

%% Linear Velocity

vA = 1i*a.*w2v.*exp(1i.*t2v);

vA = abs(vA);

vB = 1i*c.*w4v.*exp(1i.*t4v);

vB

vB = abs(vB);
%% Ploting - Angular Velocity

figure(2);

plot(t, w3v, 'r-', 'LineWidth', 1.5);
hold on;
title('Gráfico 1 - Omega 3', 'FontName', 'Times', 'FontSize', 12)
xlabel('Tempo, (s)', 'FontName', 'Times', 'FontSize', 12)
ylabel('Velocidade Angular, (rad/s)', 'FontName', 'Times', 'FontSize', 12)

grid on;

figure(3);

plot(t, w4v, 'r-', 'LineWidth', 1.5);
hold on;
title('Gráfico 2 - Omega 4', 'FontName', 'Times', 'FontSize', 12)
xlabel('Tempo, (s)', 'FontName', 'Times', 'FontSize', 12)
ylabel('Velocidade Angular, (rad/s)', 'FontName', 'Times', 'FontSize', 12)

grid on;

%% Acceleration - given given a, b, w2, w3, w4, a2a tk {k e N | [2, 3, 4]}
a2a = 0;

a3a = linspace(0, 1, N)'; a4a = linspace(0, 1, N)';

for iter = 1:length(a3a)
    A = c*sin(t4v(iter)); B = b*sin(t4v(iter)); D = c*cos(t4v(iter)); E = b*cos(t3v(iter));
    C = a*a2a*sin(t2v(iter)) + a*(w2v(iter)^2)*cos(t2v(iter)) + b*(w3v(iter)^2)*cos(t3v(iter)) - c*(w4v(iter)^2)*cos(t4v(iter));
    F = a*a2a*cos(t2v(iter)) - a*(w2v(iter)^2)*sin(t2v(iter)) - b*(w3v(iter)^2)*sin(t3v(iter)) + c*(w4v(iter)^2)*sin(t4v(iter));
    
    a3a(iter) = (C*D - A*F)/(A*E-B*D);
    a4a(iter) = (C*E - B*F)/(A*E-B*D);
end

% Ploting

figure(4);

plot(t, a3a, 'r-', 'LineWidth', 1.5);
hold on;
title('Gráfico 3 - Alpha 3', 'FontName', 'Times', 'FontSize', 12)
xlabel('Tempo, (s)', 'FontName', 'Times', 'FontSize', 12)
ylabel('Aceleração Angular, (rad/s^2)', 'FontName', 'Times', 'FontSize', 12)

grid on;

figure(5);

plot(t, a4a, 'r-', 'LineWidth', 1.5);
hold on;
title('Gráfico 4 - Alpha 4', 'FontName', 'Times', 'FontSize', 12)
xlabel('Tempo, (s)', 'FontName', 'Times', 'FontSize', 12)
ylabel('Aceleração Angular, (rad/s^2)', 'FontName', 'Times', 'FontSize', 12)

grid on;