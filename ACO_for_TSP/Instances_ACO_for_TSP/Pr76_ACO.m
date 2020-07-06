% ##########################################################
%               TSPLIB instance : Pr76
%             Optimal solution : 108159
% ##########################################################

clear all

x = [3600 3100 4700 5400 5608 4493 3600 3100 4700 5400 5610 4492 3600 ...
    3100 4700 5400 6650 7300 7300 6650 7300 6650 5400 8350 7850 9450 ...
    10150 10358 9243 8350 7850 9450 10150 10360 9242 8350 7850 9450 ...
    10150 11400 12050 12050 11400 12050 11400 10150 13100 12600 14200 ...
    14900 15108 13993 13100 12600 14200 14900 15110 13992 13100 12600 ...
    14200 14900 16150 16800 16800 16150 16800 16150 14900 19800 19800 ...
    19800 19800 200 200 200];
y = [2300 3300 5750 5750 7103 7102 6950 7250 8450 8450 10053 10052 ...
    10800 10950 11650 11650 10800 10950 7250 6950 3300 2300 1600 2300 ...
    3300 5750 5750 7103 7102 6950 7250 8450 8450 10053 10052 10800 ...
    10950 11650 11650 10800 10950 7250 6950 3300 2300 1600 2300 3300 ...
    5750 5750 7103 7102 6950 7250 8450 8450 10053 10052 10800 10950 ...
    11650 11650 10800 10950 7250 6950 3300 2300 1600 800 10000 11900 ...
    12200 12200 1100 800];

%Fixed parameters for all methods:
num_cities = length(x);
num_Ants = num_cities;
Maxit = 100;
Lexact = 108159;

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
