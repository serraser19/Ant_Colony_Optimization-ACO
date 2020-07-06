% #########################################################################
% Intelligent Water Drops Algorithm (IWD) for Travelling Salesman Problem (TSP)
%                        ALGORITHM  : IWD-TSP
% #########################################################################
% Parameters -->  x        : list of first coordinates of graph vertices 
%            -->  y        : list of second coordinates of graph vertices 
%            -->  iter_max : Maximun nº of iterations
%            -->  N_c      : Nº of graph vertices
%            -->  N_IWD    : Nº of artificial intelligent water drops

%            -->  a_v      ]
%            -->  b_v      ] --> Parameters for velocity update
%            -->  c_v      ]

%            -->  a_s      ]
%            -->  b_s      ] --> Parameters for Soil update
%            -->  c_s      ]

%            -->  p_n      : Parameter for local Soil update
%            -->  p_IWD    : Parameter for global Soil update
%            -->  InitSoil : Preliminary amount of Soil
%            -->  InitVel  : Initial velocity
%            -->  epsilon_s: Used for the choice of the following vertex 
%                           (probabilistic rule)
%            -->  N_i      : Nº of iteration for Soil reset
%            -->  alpha_l  : Parameter used for Soil reset (IWD-TSP)

% Output     -->  T_tb     : Best tour length found
% """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function T_tb = IWD_for_TSP(x,y,iter_max,N_c,N_IWD,a_v,b_v,c_v,a_s,b_s,c_s,p_n,p_IWD,InitSoil,InitVel,epsilon_s,N_i,alpha_l)

T_tb = 10000000; % + infinite
iter_count = 0; % iteration counter

% -------------------- Distance matrix -------------------------
for i = 1:N_c
    for j = i:N_c
        len_mat(i,j) = sqrt((x(i)-x(j))^2 + (y(i)-y(j))^2); 
        len_mat(j,i) = len_mat(i,j);
    end
end

% ---------------------- Soil matrix ---------------------------
for i = 1:N_c
    for j = i:N_c
        Soil(i,j) = InitSoil;
        Soil(j,i) = Soil(i,j);
    end
end

% initialize velocity and Soil of the IWDs
Vel_IWD(1:N_IWD,1:N_c,1:N_c) = InitVel; 
Soil_IWD(1:N_IWD,1:N_c,1:N_c) = 0;

while iter_count <=iter_max
    V_c = [];  % Visited vertices
    for k = 1:N_IWD
        NV_c = 1:N_c; % unvisited vertices
        initpos = randi(N_c); % first vertex visited
        pos = 2; % position counter
        iaux = initpos;
        V_c(k,1) = initpos;    
        NV_c(initpos) = [];
        while length(NV_c) ~= 0
            pij_IWD = [];  % transition probability of the k-IWD
            pij_IWDt = []; % to see better the probability intervals
            cond_g = min(Soil(iaux,V_c(k,find(V_c(k,:)))));
            for j = NV_c
                if cond_g >=0
                    g(iaux,j) = Soil(iaux,j);
                else
                    g(iaux,j) = Soil(iaux,j)-cond_g;
                end
                pij_IWD(k,j) = 1/(epsilon_s + g(iaux,j));
            end
            pij_IWD(k,:) = pij_IWD(k,:)/sum(pij_IWD(k,:));
            pij_IWDt(k,:) = [0,pij_IWD(k,:)]; % probability intervals
            rand_num = rand; % random number in (0,1) interval
            h = 1;
            while h <=length(pij_IWDt(k,:))-1
                if rand_num >= sum(pij_IWDt(k,1:h)) & rand_num < sum(pij_IWDt(k,1:h+1))
                    jaux = h;
                    break
                end
                h = h+1;
            end
            V_c(k,pos) = jaux; % add nex visited vertex
            iaux = jaux; % That vertex will now be the new one from which it starts
            pos = pos + 1;       
            NV_c(find(NV_c == jaux)) = []; % remove it from the unvisited
        end
        
        % ------------------- Soil update --------------------
        for i = 1:length(V_c(k,:))-1
            Vel_IWD(k,V_c(k,i),V_c(k,i+1)) = Vel_IWD(k,V_c(k,i),V_c(k,i+1)) + a_v/(b_v + c_v* (Soil(V_c(k,i),V_c(k,i+1)))^2);
            Vel_IWD(k,V_c(k,i+1),V_c(k,i)) = Vel_IWD(k,V_c(k,i),V_c(k,i+1));
            HUD_TSP = [x(V_c(i))-x(V_c(i+1)),y(V_c(i))-y(V_c(i+1))];
            DeltaSoil(k,V_c(k,i),V_c(k,i+1)) = a_s/(b_s + c_s*(norm(HUD_TSP)/Vel_IWD(k,V_c(k,i),V_c(k,i+1)))^2);
            DeltaSoil(k,V_c(k,i+1),V_c(k,i)) = DeltaSoil(k,V_c(k,i),V_c(k,i+1));
            Soil(V_c(k,i),V_c(k,i+1)) = (1-p_n)*Soil(V_c(k,i),V_c(k,i+1)) - p_n*DeltaSoil(k,V_c(k,i),V_c(k,i+1));
            Soil(V_c(k,i+1),V_c(k,i)) = Soil(V_c(k,i),V_c(k,i+1));
            Soil_IWD(k,V_c(k,i),V_c(k,i+1)) = Soil_IWD(k,V_c(k,i),V_c(k,i+1)) + DeltaSoil(k,V_c(k,i),V_c(k,i+1));
            Soil_IWD(k,V_c(k,i+1),V_c(k,i)) = Soil_IWD(k,V_c(k,i),V_c(k,i+1));
        end
        % way back to the origin 
        Vel_IWD(k,V_c(k,length(V_c(k,:))),V_c(k,1)) = Vel_IWD(k,V_c(k,length(V_c(k,:))),V_c(k,1)) + a_v/(b_v + c_v* (Soil(V_c(k,length(V_c(k,:))),V_c(k,1)))^2);
        Vel_IWD(k,V_c(k,1),V_c(k,length(V_c(k,:)))) = Vel_IWD(k,V_c(k,length(V_c(k,:))),V_c(k,1)) ;
        HUD_TSPf = [x(V_c(k,length(V_c(k,:))))-x(V_c(k,1)),y(V_c(k,length(V_c(k,:))))-y(V_c(k,1))];
        DeltaSoil(k,V_c(k,length(V_c(k,:))),V_c(k,1)) = a_s/(b_s+ c_s*(norm(HUD_TSPf)/Vel_IWD(k,V_c(k,length(V_c(k,:))),V_c(k,1))^2));
        DeltaSoil(k,V_c(k,1),V_c(k,length(V_c(k,:)))) = DeltaSoil(k,V_c(k,length(V_c(k,:))),V_c(k,1));
        Soil(V_c(k,length(V_c(k,:))),V_c(k,1)) = (1-p_n)*Soil(V_c(k,length(V_c(k,:))),V_c(k,1)) - p_n*DeltaSoil(k,V_c(k,length(V_c(k,:))),V_c(k,1));
        Soil(V_c(k,1),V_c(k,length(V_c(k,:)))) = Soil(V_c(k,length(V_c(k,:))),V_c(k,1));
        Soil_IWD(k,length(V_c(k,:)),V_c(k,1)) = Soil_IWD(k,length(V_c(k,:)),V_c(k,1)) + DeltaSoil(k,V_c(k,length(V_c(k,:))),V_c(k,1));
        Soil_IWD(k,V_c(k,1),length(V_c(k,:))) = Soil_IWD(k,length(V_c(k,:)),V_c(k,1));

        % Quality of solutions (better quality the shorter the tour length) :
        len_tour(k) = 0;        
        for i = 1:length(V_c(k,:))-1
            len_tour(k) = len_tour(k) + len_mat(V_c(k,i),V_c(k,i+1)); 
        end
        % edge back to the starting point
        len_tour(k) = len_tour(k) + len_mat(V_c(k,length(V_c(k,:))),V_c(k,1));  
    
    end % end IWDs loop

    %Iteration best solution (T_ib) :
    IWD_ib = find(len_tour==min(len_tour)); % best IWD of the iteration
    T_ib = min(len_tour);
    % Soil update for the best IWD of the iteration : 
    for i = 1:length(V_c(IWD_ib(1),:))-1
        Soil(V_c(IWD_ib,i),V_c(IWD_ib,i+1)) = (1+p_IWD)*Soil(V_c(IWD_ib,i),V_c(IWD_ib,i+1))-p_IWD*Soil_IWD(IWD_ib,V_c(IWD_ib,i),V_c(IWD_ib,i+1))/(N_c-1);
        Soil(V_c(IWD_ib,i+1),V_c(IWD_ib,i)) = Soil(V_c(IWD_ib,i),V_c(IWD_ib,i+1));
    end
    % way back to the origin
    Soil(V_c(IWD_ib,N_c),V_c(IWD_ib,1)) = (1+p_IWD)*Soil(V_c(IWD_ib,N_c),V_c(IWD_ib,1))-p_IWD*Soil_IWD(IWD_ib)/(N_c-1);
    Soil(V_c(IWD_ib,1),V_c(IWD_ib,N_c)) = Soil(V_c(IWD_ib,N_c),V_c(IWD_ib,1));
    
    % Total best solution (T_tb)    
    if T_ib <= T_tb
        T_tb = T_ib; % Output
        IWD_best = find(len_tour==min(len_tour)); % best IWD for the moment  
    end
    
    % uncomment if you want to see the iteration counter and the average tours of each iteration:  
    %                                 |
%              disp('Iteracion:'),disp(num2str(iter_count))
%     disp(mean(len_tour))  % it is suposed to be minimized little by little in each iteration
    
    % IWD-TSP modification (Soil reset)
    if mod(iter_count, N_i) == 0 
        Soil(:,:) = InitSoil;
        Tau_l = rand;
        for i = 1:N_c-1
            Soil(V_c(IWD_best,i),V_c(IWD_best,i+1)) = alpha_l*Tau_l*InitSoil;
            Soil(V_c(IWD_best,i+1),V_c(IWD_best,i)) = Soil(V_c(IWD_best,i),V_c(IWD_best,i+1));
        end
        Soil(V_c(IWD_best,N_c),V_c(IWD_best,1)) = alpha_l*Tau_l*InitSoil;
        Soil(V_c(IWD_best,1),V_c(IWD_best,N_c)) = Soil(V_c(IWD_best,N_c),V_c(IWD_best,1));
    end
    iter_count = iter_count + 1;
    
end % end iteration loop

%------------------ Optimal route drawing ---------------
hold on
plot(x,y,'o','LineWidth',1,'MarkerSize',5,'MarkerEdgeColor',...
    'b','MarkerFaceColor','g');
plot(x(V_c(IWD_best(1),:)),y(V_c(IWD_best(1),:)),'r-')
plot([x(V_c(IWD_best(1),length(V_c(IWD_best(1),:)))),x(V_c(IWD_best(1),1))],[y(V_c(IWD_best(1),length(V_c(IWD_best(1),:)))),y(V_c(IWD_best(1),1))],'-r')
hold off
end