% ##########################################################
%             VRP web instance : E-n23-k3
%                Optimal solution : 569
%                       Q = 4500
% ##########################################################

clear all

x = [266 295 301 309 217 218 282 242 230 249 256 265 267 259 315 329 318 329 ...
    267 275 303 208 326];
y = [235 272 258 260 274 278 267 249 262 268 267 257 242 265 233 252 252 224 ...
    213 192 201 217 181];
% Demands : 
q = [0 125 84 60 500 300 175 350 150 1100 4100 225 300 250 500 150 100 250 120 ...
    600 500 175 75];

%Fixed parameters for each instance:
Q = 4500;
num_Ants = 3;
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

