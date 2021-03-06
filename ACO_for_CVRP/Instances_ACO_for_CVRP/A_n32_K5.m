% ##########################################################
%             VRP web instance : A-n32-k5
%                Optimal solution : 784
%                       Q = 100
% ##########################################################

clear all

x = [82 96 50 49 13 29 58 84 14 2 3 5 98 84 61 1 88 91 19 93 50 98 5 42 61 ...
    9 80 57 23 20 85 98];
y = [76 44 5 8 7 89 30 39 24 39 82 10 52 25 59 65 51 2 32 3 93 14 42 9 62 ...
    97 55 69 15 70 60 5];
% Demands :
q =[0 19 21 6 19 7 12 16 6 16 8 14 21 16 3 22 18 19 1 24 8 12 4 8 24 24 2 20 15 2 14 9];

%Fixed parameters for each instance:
Q = 100;
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

