% ##########################################################
%              TSPLIB instance : Eil51
%              Optimal solution : 426
% ##########################################################

clear all

x = [37 49 52 20 40 21 17 31 52 51 42 31 5 12 36 52 27 17 13 57 ...
   62 42 16 8 7 27 30 43 58 58 37 38 46 61 62 63 32 45 59 5 10 ...
   21 5 30 39 32 25 25 48 56 30];
y = [52 49 64 26 30 47 63 62 33 21 41 32 25 42 16 41 23 33 13 58 ...
    42 57 57 52 38 68 48 67 48 27 69 46 10 33 63 69 22 35 15 6 ...
    17 10 64 15 10 39 32 55 28 37 40];

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
