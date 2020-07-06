% ##########################################################
%              TSPLIB instance : lin105
%              Optimal solution : 14379
% ##########################################################

clear all

x = [63 94 142 173 205 213 244 276 283 362 394 449 480 512 528 583 591 638 ...
     638 638 638 669 677 677 677 709 709 709 701 764 811 843 858 890 921 992 ...
     1000 1197 1228 1276 1299 1307 1362 1362 1362 1425 1425 1425 1417 1488 ...
     1488 1488 1551 1551 1551 1614 1614 1614 1732 1811 1843 1913 1921 2087 ...
     2118 2150 2189 2220 2220 2228 2244 2276 2276 2276 2315 2315 2315 2331 ...
     2346 2346 2346 2362 2402 2402 2480 2496 2528 2559 2630 2638 2756 2787 ...
     2803 2835 2866 2906 2937 2937 2945 3016 3055 3087 606 1165 1780];
y = [71 71 370 1276 1213 69 69 630 732 69 69 370 1276 1213 157 630 732 654 ...
    496 314 142 142 315 496 654 654 496 315 142 220 189 173 370 1276 1213 ...
    630 732 1276 1213 205 630 732 654 496 291 654 496 291 173 291 496 654 ...
    654 496 291 291 496 654 189 1276 1213 630 732 370 1276 1213 205 189 630 ...
    732 142 315 496 654 654 496 315 142 315 496 654 142 157 220 142 370 1276 ...
    1213 630 732 69 69 370 1276 1213 69 69 630 732 1276 69 69 220 370 370];
 
%Fixed parameters for all methods:
num_cities = length(x);
num_Ants = num_cities;
Maxit = 100;
Lexact = 14379;

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
