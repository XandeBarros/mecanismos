%% Simulacao de mecanismo de quatro barras
set(0, 'DefaultTextInterpreter', 'Latex')
clear all, close all, clc,
dtr = 180/pi; %degtorad factor

%% Dados do mecanismo
velacel=1;
% Lengths of links
  delta = 89/4; % final_nusp / 4
  a = (40 - delta)*10^-3; 
  b = (120 + delta)*10^-3;
  c = (80 - delta)*10^-3;
  d = (100 + delta)*10^-3; % Grashof Crank-Rocker
% End-effector P
   AP=0.1; tAP=0.3;
   
   
%% Setup of input
% Initial t2
t2i=39*dtr;
% Number of steps
N=400;
% Vector of time instants
t=linspace(0,1,N)';
% Vector of values for t2 (for imposed t2 in constant steps)
% t2v=t2i+linspace(0,4*pi,N)';
  % Vector of values for t2 (for imposed w2 constant)
   w2=4*pi; t2v=t2i+w2*t; w2v=w2*ones(size(t)); a2v=zeros(size(t));
    % Vector of values for t2 (for imposed a2 constant)
    % a2=8*pi; t2v=t2i+a2/2*t.^2; a2v=a2*ones(size(t)); w2v=a2*t;

%% Newton-Raphson algorithm for the evaluation of t3 and t4 given t2
tol=0.001;
% Initial guesses for t3 and t4
  t3=26*dtr; t4=39*dtr; % Circuito aberto ou cruzado?
disp('    it2   Iterations')
for it2=1:length(t2v)
   t2=t2v(it2); B=tol+1; iconv=0;
   while norm(B)>tol
       iconv=iconv+1;
       A=[-b*sin(t3) c*sin(t4);b*cos(t3) -c*cos(t4)];
       B=[a*cos(t2)+b*cos(t3)-c*cos(t4)-d; a*sin(t2)+b*sin(t3)-c*sin(t4)];
       Dt=-A\B;
       t3=t3+Dt(1); t4=t4+Dt(2);
   end
   if iconv>2 disp([it2 iconv]), end % Show number of iterations required to converge
   t3v(it2,1)=t3; t4v(it2,1)=t4;
end

%% Show simulation
% simulation

%% Post-processing for velocities and accelerations
if velacel==1
    velacel_g
end
