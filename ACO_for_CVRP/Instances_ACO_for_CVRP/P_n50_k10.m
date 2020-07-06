% ##########################################################
%             VRP web instance : P-n50-k10
%                Optimal solution : 696
%                       Q = 100
% ##########################################################

clear all

x = [40 22 36 21 45 55 33 50 55 26 40 55 35 62 62 62 21 33 9 62 66 44 26 11 ...
    7 17 41 55 35 52 43 31 22 26 50 55 54 60 47 30 30 12 15 16 21 50 51 50 ...
    48 12];
y = [40 22 26 45 35 20 34 50 45 59 66 65 51 35 57 24 36 44 56 48 14 13 13 28 ...
    43 64 46 34 16 26 26 76 53 29 40 50 10 15 66 60 50 17 14 19 48 30 42 15 ...
    21 38];
% Demands :
q = [0 18 26 11 30 21 19 15 16 29 26 37 16 12 31 8 19 20 13 15 22 28 12 6 27 ...
    14 18 17 29 13 22 25 28 27 19 10 12 14 24 16 33 15 11 18 17 21 27 19 20 5];

%Fixed parameters for each instance:
Q = 100;
num_Ants = 10;
Maxit = 100;
alpha = 1.2;
beta = 6.5;
rho = 0.9;
sigma = num_Ants;

% ##################################################################
%                         CONFIGURATIONS:
% CVRP1 :               No more parameters   

% CVRP2 :     gamma >> lambda ----> gamma = 5; lambda = 1;
%             gamma << lambda ----> gamma = 1; lambda = 5;
%             gamma == lambda ----> gamma = 5; lambda = 5;

% CVRP3 :             gamma >> 1 ----> gamma = 5; 
%                     gamma == 1 ----> gamma = 1; 
%                  gamma in (0,1) ----> gamma = 0.3; 
% ##################################################################

% Introduce the parameters you want to use and uncomment : 
% gamma = ;
% lambda = ;

% ------------------------------------------------------------------
%            Uncomment the algorithm you want to 
%         use with one of the previous configurations:

% sol_CVRP1 = ACO_for_CVRP1(x,y,q,Q,Maxit,num_Ants,alpha,beta,rho,sigma);
% sol_CVRP2 = ACO_for_CVRP2(x,y,q,Q,Maxit,num_Ants,alpha,beta,rho,gamma,lambda,sigma);
% sol_CVRP3 = ACO_for_CVRP3(x,y,q,Q,Maxit,num_Ants,alpha,beta,rho,gamma,sigma);
% ------------------------------------------------------------------

% --------------------------- Output -------------------------------
%            Uncomment the algorithm that has been used:

% disp('CVRP1:'), disp(num2str(sol_CVRP1))
% disp('CVRP2:'), disp(num2str(sol_CVRP2))
% disp('CVRP3:'), disp(num2str(sol_CVRP3))

