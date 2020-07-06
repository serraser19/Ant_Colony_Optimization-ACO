% ##########################################################
%             VRP web instance : P-n45-k5
%                Optimal solution : 510
%                       Q = 150
% ##########################################################

clear all

x = [30 37 49 52 20 40 21 17 31 52 51 42 31 5 12 36 52 27 17 13 57 62 42 16 8 ...
    7 27 30 43 58 58 37 38 46 61 62 63 32 45 59 5 10 21 5 30];
y = [40 52 49 64 26 30 47 63 62 33 21 41 32 25 42 16 41 23 33 13 58 42 57 57 ...
    52 38 68 48 67 48 27 69 46 10 33 63 69 22 35 15 6 17 10 64 15];
% Demands :
q = [0 7 30 16 9 21 15 19 23 11 5 19 29 23 21 10 15 3 41 9 28 8 8 16 10 28 7 ...
    15 14 6 19 11 12 23 26 17 6 9 15 14 7 27 13 11 16];

%Fixed parameters for each instance:
Q = 150;
num_Ants = 5;
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

