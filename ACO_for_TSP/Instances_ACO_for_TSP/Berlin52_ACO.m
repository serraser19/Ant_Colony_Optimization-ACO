% ##########################################################
%               TSPLIB instance : Berlin52
%              Optimal solution : 7544,3659
% ##########################################################

clear all

x = [565.0 25.0 345.0 945.0 845.0 880.0 25.0 525.0 580.0 650.0 1605.0 ...
    1220.0 1465.0 1530.0 845.0 725.0 145.0 415.0 510.0 560.0 300.0 ...
    520.0 480.0 835.0 975.0 1215.0 1320.0 1250.0 660.0 410.0 420.0 ...
    575.0 1150.0 700.0 685.0 685.0 770.0 795.0 720.0 760.0 475.0 95.0 ...
    875.0 700.0 555.0 830.0 1170.0 830.0 605.0 595.0 1340.0 1740.0];

y = [575.0 185.0 750.0 685.0 655.0 660.0 230.0 1000.0 1175.0 1130.0 ...
    620.0  580.0  200.0 5.0 680.0 370.0 665.0 635.0 875.0 365.0 465.0 ...
    585.0 415.0 625.0 580.0 245.0 315.0 400.0 180.0 250.0 555.0 665.0 ...
    1160.0 580.0 595.0 610.0 610.0 645.0 635.0 650.0 960.0 260.0 920.0 ...
    500.0 815.0 485.0 65.0 610.0 625.0 360.0 725.0 245.0];

%Fixed parameters for all methods:
num_cities = length(x);
num_Ants = num_cities;
Maxit = 100;
Lexact = 7544.3659;

% ##################################################################
%                         CONFIGURATIONS:
%           * Uncomment the configuration you want to use *
%                            Conf. 1 : 
%       alpha=1; beta=10; rho=0.25; q0=0.7; phi=0.98; tau0=10^(-7);
%                            Conf. 2 : 
%      alpha=0.97754; beta=5; rho=0.17447; q0=0.54; phi=0.36; tau0=0;
%                            Conf. 3 : 
%      alpha=6; beta=1; rho=0.25; q0=0.7; phi=0.98; tau0=10^(-7);
%                            Conf. 4 : 
%      alpha=0.9; beta=6; rho=0.55; q0=0.97; phi=0.1; tau0=10^(-7);
%                            Conf. 5 : 
%      alpha=1.2; beta=6.5; rho=0.3; q0=0.6; phi=0.3; tau0=10^(-7);
% ##################################################################

% ------------------------------------------------------------------
%            Uncomment the algorithm you want to 
%         use with one of the previous configurations:

% sol_AS = AS_for_TSP(x,y,Maxit,num_Ants,alpha,beta,rho);
% sol_ACS1 = ACS1_for_TSP(x,y,Maxit,num_Ants,alpha,beta,rho,q0,phi,tau0);
% sol_ACS2 = ACS2_for_TSP(x,y,Maxit,num_Ants,alpha,beta,rho,q0,phi,tau0);
% sol_MMAS1 = MMAS1_for_TSP(x,y,Maxit,num_Ants,alpha,beta,rho);
% sol_MMAS2 = MMAS2_for_TSP(x,y,Maxit,num_Ants,alpha,beta,rho,Lexact);
% ------------------------------------------------------------------

% --------------------------- Output -------------------------------
%            Uncomment the algorithm that has been used:

% disp('AS:'), disp(num2str(sol_AS))
% disp('ACS1:'), disp(num2str(sol_ACS1))
% disp('ACS2:'), disp(num2str(sol_ACS2))
% disp('MMAS1:'), disp(num2str(sol_MMAS1))
% disp('MMAS2:'), disp(num2str(sol_MMAS2))
