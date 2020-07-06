% ##########################################################
%             VRP web instance : A-n37-k5
%                Optimal solution : 669
%                       Q = 100
% ##########################################################

clear all

x = [38 59 96 47 26 66 96 37 68 78 82 93 74 60 78 36 45 73 10 98 92 43 53 78 72 ...
     37 16 75 11 9 25 8 12 50 26 18 22];
y = [46 46 42 61 15 6 7 25 92 84 28 90 42 20 58 48 36 57 91 51 62 42 25 65 79 ...
     88 73 96 66 49 72 68 61 2 54 89 53];
% Demands :
q =[0 16 18 1 13 8 23 7 27 1 3 6 24 19 2 5 16 7 4 22 7 23 16 2 2 9 2 12 1 9 23 ...
    6 19 7 7 20 20];

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

