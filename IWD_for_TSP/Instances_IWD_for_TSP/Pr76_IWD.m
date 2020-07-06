% ##########################################################
%               TSPLIB instance : Pr76
%             Optimal solution : 108159
% ##########################################################

clear all

x = [3600 3100 4700 5400 5608 4493 3600 3100 4700 5400 5610 4492 3600 ...
    3100 4700 5400 6650 7300 7300 6650 7300 6650 5400 8350 7850 9450 ...
    10150 10358 9243 8350 7850 9450 10150 10360 9242 8350 7850 9450 ...
    10150 11400 12050 12050 11400 12050 11400 10150 13100 12600 14200 ...
    14900 15108 13993 13100 12600 14200 14900 15110 13992 13100 12600 ...
    14200 14900 16150 16800 16800 16150 16800 16150 14900 19800 19800 ...
    19800 19800 200 200 200];
y = [2300 3300 5750 5750 7103 7102 6950 7250 8450 8450 10053 10052 ...
    10800 10950 11650 11650 10800 10950 7250 6950 3300 2300 1600 2300 ...
    3300 5750 5750 7103 7102 6950 7250 8450 8450 10053 10052 10800 ...
    10950 11650 11650 10800 10950 7250 6950 3300 2300 1600 2300 3300 ...
    5750 5750 7103 7102 6950 7250 8450 8450 10053 10052 10800 10950 ...
    11650 11650 10800 10950 7250 6950 3300 2300 1600 800 10000 11900 ...
    12200 12200 1100 800];

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
