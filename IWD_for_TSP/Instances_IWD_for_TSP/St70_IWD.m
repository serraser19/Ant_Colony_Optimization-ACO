% ##########################################################
%             TSPLIB instance : St70
%             Optimal solution : 675
% ##########################################################

clear all

x = [64 80 69 72 48 58 81 79 30 42 7 29 78 64 95 57 40 68 92 62 28 76 67 93 6 87 ...
    30 77 78 55 82 73 20 27 95 67 48 75 8 20 54 63 44 52 12 25 58 5 90 41 25 37 56 ...
    10 98 16 89 48 81 29 17 5 79 9 17 74 10 48 83 84];
y = [96 39 23 42 67 43 34 17 23 67 76 51 92 8 57 91 35 40 34 1 43 73 88 54 8 ...
    18 9 13 94 3 88 28 55 43 86 99 83 81 19 18 38 36 33 18 13 5 85 67 9 76 76 64 ...
    63 55 7 74 60 82 76 60 22 45 70 100 82 67 68 19 86 94];

%Fixed parameters for IWD:
N_c = length(x);
N_IWD = N_c;
iter_max = 3000;
InitSoil = 10000;
InitVel = 200;
a_v = 1;
b_v = 0.01;
c_v = 1;
a_s = 1;
b_s = 0.01;
c_s = 1;
p_n = 0.9;
p_IWD = 0.9;
epsilon_s = 0.01;
N_i = 15;

% ##################################################################
%                         CONFIGURATIONS:
%           * Uncomment the configuration you want to use *
%                            Conf. 1 : 
%                          alpha_l = 0.1;
%                            Conf. 2 : 
%                          alpha_l = 0.01;
%                            Conf. 3 : 
%                         alpha_l = 0.001;
%                            Conf. 4 : 
%                         alpha_l = 0.0001;
%                            Conf. 5 : 
%                        alpha_l = 0.00001;
% ##################################################################

% ------------------------------------------------------------------
%               Uncomment the algorithm to 
%         use with one of the previous configurations:

% sol_IWD = IWD_for_TSP(x,y,iter_max,N_c,N_IWD,a_v,b_v,c_v,a_s,b_s,c_s,p_n,p_IWD,InitSoil,InitVel,epsilon_s,N_i,alpha_l);
% ------------------------------------------------------------------

% --------------------------- Output -------------------------------
%            Uncomment the algorithm that has been used:

% disp('IWD-TSP:'), disp(num2str(sol_IWD))
