% ##########################################################
%              TSPLIB instance : KroC100
%              Optimal solution : 20749
% ##########################################################

clear all

x = [1357 2650 1774 1307 3806 2687 43 3092 185 834 4 1183 2048 1097 1838 ...
     234 3314 737 779 2312 2576 3078 2781 705 3409 323 1660 3729 693 2361 ...
     2433 554 913 3586 2636 1000 482 3704 3635 1362 2049 2552 3939 219 812 ...
     901 2513 242 826 3278 86 14 1327 2773 2469 3835 1031 3853 1868 1544 457 ...
     3174 192 2318 2232 396 2365 2499 1410 2990 3646 3394 1779 1058 2933 3099 ...
     2178 138 2082 2302 805 22 3213 99 1533 3564 29 3808 2221 3499 3124 781 ...
     1027 3249 3297 213 721 3736 868 960];
y = [1905 802 107 964 746 1353 1957 1668 1542 629 462 1391 1628 643 1732 1118 ...
    1881 1285 777 1949 189 1541 478 1812 1917 1714 1556 1188 1383 640 1538 ...
    1825 317 1909 727 457 1337 1082 1174 1526 417 1909 640 898 351 1552 1572 ...
    584 1226 799 1065 454 1893 1286 1838 963 428 1712 197 863 1607 1064 1004 ...
    1925 1374 828 1649 658 307 214 1018 1028 90 372 1459 173 978 1610 1753 1127 ...
    272 1617 1085 536 1780 676 6 1375 291 1885 408 671 1041 378 491 220 186 1542 ...
    731 303];

%Fixed parameters for all methods:
num_cities = length(x);
num_Ants = num_cities;
Maxit = 100;
Lexact = 20749;

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
