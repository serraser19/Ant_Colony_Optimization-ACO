% ##########################################################
%             TSPLIB instance : Eil101
%              Optimal solution : 629
% ##########################################################

clear all

x = [41 35 55 55 15 25 20 10 55 30 20 50 30 15 30 10 5 20 15 45 45 45 55 ...
    65 65 45 35 41 64 40 31 35 53 65 63 2 20 5 60 40 42 24 23 11 6 2 8 13 ...
    6 47 49 27 37 57 63 53 32 36 21 17 12 24 27 15 62 49 67 56 37 37 57 47 ...
    44 46 49 49 53 61 57 56 55 15 14 11 16 4 28 26 26 31 15 22 18 26 25 22 ...
    25 19 20 18 35];
y = [49 17 45 20 30 30 50 43 60 60 65 35 25 10 5 20 30 40 60 65 20 10 5 35 ...
     20 30 40 37 42 60 52 69 52 55 65 60 20 5 12 25 7 12 3 14 38 48 56 52 ...
     68 47 58 43 31 29 23 12 12 26 24 34 24 58 69 77 77 73 5 39 47 56 68 16 ...
     17 13 11 42 43 52 48 37 54 47 37 31 22 18 18 52 35 67 19 22 24 27 24 ...
     27 21 21 26 18 35];
 
%Fixed parameters for all methods:
num_cities = length(x);
num_Ants = num_cities;
Maxit = 100;
Lexact = 629;

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
