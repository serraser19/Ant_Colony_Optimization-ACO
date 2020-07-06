% ##########################################################
%             TSPLIB instance : KroA100
%              Optimal solution : 21282
% ##########################################################

clear all

x = [1380 2848 3510 457 3888 984 2721 1286 2716 738 1251 2728 3815 3683 1247 ...
    123 1234 252 611 2576 928 53 1807 274 2574 178 2678 1795 3384 3520 1256 ...
    1424 3913 3085 2573 463 3875 298 3479 2542 3955 1323 3447 2936 1621 3373 ...
    1393 3874 938 3022 2482 3854 376 2519 2945 953 2628 2097 890 2139 2421 ...
    2290 1115 2588 327 241 1917 2991 2573 19 3911 872 2863 929 839 3893 2178 ...
    3822 378 1178 2599 3416 2961 611 3113 2597 2586 161 1429 742 1625 1187 ...
    1787 22 3640 3756 776 1724 198 3950];
y = [939 96 1671 334 666 965 1482 525 1432 1325 1832 1698 169 1533 1945 862 ...
    1946 1240 673 1676 1700 857 1711 1420 946 24 1825 962 1498 1079 61 1728 ...
    192 1528 1969 1670 598 1513 821 236 1743 280 1830 337 1830 1646 1368 1318 ...
    955 474 1183 923 825 135 1622 268 1479 981 1846 1806 1007 1810 1052 302 ...
    265 341 687 792 599 674 1673 1559 558 1766 620 102 1619 899 1048 100 901 ...
    143 1605 1384 885 1830 1286 906 134 1025 1651 706 1009 987 43 882 392 1642 ...
    1810 1558];

%Fixed parameters for all methods:
num_cities = length(x);
num_Ants = num_cities;
Maxit = 100;
Lexact = 21282;

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
