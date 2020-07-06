% ##########################################################
%             TSPLIB instance : rat99
%             Optimal solution : 1211
% ##########################################################

clear all

x = [6 15 24 33 48 57 67 77 86 6 17 23 32 43 55 65 78 87 3 12 28 33 47 55 ...
    64 71 87 4 15 22 34 42 54 66 78 87 7 17 26 32 43 57 64 78 83 5 13 25 ...
    38 46 58 67 74 88 2 17 23 36 42 53 63 72 87 2 16 25 38 42 57 66 73 86 ...
    5 13 25 35 46 54 65 73 86 2 14 28 38 46 57 63 77 85 8 12 22 34 47 58 ...
    66 78 85];
y = [4 15 18 12 12 14 10 10 15 21 26 25 35 23 35 36 39 35 53 44 53 49 46 ...
    52 50 57 57 72 78 70 71 79 77 79 67 73 81 95 98 97 88 89 85 83 98 109 ...
    111 102 119 107 110 110 113 110 124 134 129 131 137 123 135 134 129 146 ...
    147 153 155 158 154 151 151 149 177 162 169 177 172 166 174 161 162 195 ...
    196 189 187 195 194 188 193 194 211 217 210 216 203 213 206 210 204];

%Fixed parameters for all methods:
num_cities = length(x);
num_Ants = num_cities;
Maxit = 100;
Lexact = 1211;

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
