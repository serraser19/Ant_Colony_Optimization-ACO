% ##########################################################
%             VRP web instance : P-n101-k4
%                Optimal solution : 681
%                       Q = 400
% ##########################################################

clear all

x = [35 41 35 55 55 15 25 20 10 55 30 20 50 30 15 30 10 5 20 15 45 45 45 55 65 ...
    65 45 35 41 64 40 31 35 53 65 63 2 20 5 60 40 42 24 23 11 6 2 8 13 6 47 49 ...
    27 37 57 63 53 32 36 21 17 12 24 27 15 62 49 67 56 37 37 57 47 44 46 49 49 ...
    53 61 57 56 55 15 14 11 16 4 28 26 26 31 15 22 18 26 25 22 25 19 20 18];
y = [35 49 17 45 20 30 30 50 43 60 60 65 35 25 10 5 20 30 40 60 65 20 10 5 35 ...
    20 30 40 37 42 60 52 69 52 55 65 60 20 5 12 25 7 12 3 14 38 48 56 52 68 47 ...
    58 43 31 29 23 12 12 26 24 34 24 58 69 77 77 73 5 39 47 56 68 16 17 13 11 ...
    42 43 52 48 37 54 47 37 31 22 18 18 52 35 67 19 22 24 27 24 27 21 21 26 18];
% Demands : 
q = [0 10 7 13 19 26 3 5 9 16 16 12 19 23 20 8 19 2 12 17 9 11 18 29 3 6 17 16 ...
    16 9 21 27 23 11 14 8 5 8 16 31 9 5 5 7 18 16 1 27 36 30 13 10 9 14 18 2 ...
    6 7 18 28 3 13 19 10 9 20 25 25 36 6 5 15 25 9 8 18 13 14 3 23 6 26 16 11 ...
    7 41 35 26 9 15 3 1 2 22 27 20 11 12 10 9 17];

%Fixed parameters for each instance:
Q = 400;
num_Ants = 4;
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

