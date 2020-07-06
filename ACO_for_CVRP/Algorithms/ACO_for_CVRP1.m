% #########################################################################
% Ant Colony Optimization (ACO) for Capacited Vehicle Routing Problem (CVRP)
%                   ALGORITHM  : ACO FOR CVRP1
%          CVRP1 : Building solutions with formula (2)
%                Pheromone trace update with formula (6)
% #########################################################################
% Parameters -->  x        : list of first coordinates of graph vertices 
%            -->  y        : list of second coordinates of graph vertices 
%            -->  q        : list of clients demands
%            -->  Q        : the total demand of each route cannot exceed 
%                            the limit capacity Q
%            -->  Maxit    : Maximun nº of iterations
%            -->  num_Ants : Nº of artificial ants
%            -->  alpha    : Relative importance of the pheromone
%            -->  beta     : Importance of heuristic information
%            -->  rho      : Evaporation rate
%            -->  sigma    : Nº of elitists ants

% Output     -->  sol      : Optimal tour length
% """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function sol = ACO_for_CVRP1(x,y,q,Q,Maxit,num_Ants,alpha,beta,rho,sigma)

n = length(x);  % total nº of graph vertices

% ------------------ Distance matrix --------------------------
len_mat = zeros(n);
for i = 1:n
    for j = i+1:n
        len_mat(i,j) = sqrt((x(i)-x(j))^2 + (y(i)-y(j))^2); 
        len_mat(j,i) = len_mat(i,j);
    end
end

% ---------------- Initial pheromone matrix ------------------
for i = 1:n
    for j = i+1:n
        pher_mat(i,j) = len_mat(i,j).^(-1); 
        pher_mat(j,i) = pher_mat(i,j);
    end
end

%----------- Vertices visited by ants (vehicles) -------------
iter = 1;
while iter <= Maxit
    vsit_vert = [];  % visited vertices
    nonvsit_vert = 1:n; % non-visited vertices
    k = 1;
    while k <= num_Ants          
        depot = 1; % first vertex visited by the k-ant
        vsit_vert(k,1) = depot;
        if k ~=1
            nonvsit_vert = [depot,nonvsit_vert];
        end
        nonvsit_vert(depot) = [];
        iaux = depot;
        pos = 1;   % position counter
        while pos < n-1  
            fprob = []; % transition probability of the k-ant
            for j = nonvsit_vert  
                fprob(k,j) = (pher_mat(iaux,j)^alpha)*((1/len_mat(iaux,j))^beta); % formula (2)
            end           
            fprob(k,:) = fprob(k,:)/sum(fprob(k,:));
            ind = find(fprob(k,:)); % to search the indices with non-null values
            prob = [];
            for h = ind
                prob(k,h) = sum(fprob(k,1:h));  % probability intervals
            end
            int_prob=[];
            int_prob(k,:) = [0, prob(k,ind)]; % cumulative probabilities
            [s,t] = size(int_prob(k,:));
            nrand = rand; % random number in (0,1) interval
            for i = 1:t-1
                if nrand>=int_prob(k,i) & nrand<int_prob(k,i+1)
                   jaux = i+1; 
                end
            end   
            next_ind = int_prob(k,jaux)-int_prob(k,jaux-1);
            prob_temp = [];  % to find the next vertex visited
            prob_temp(k,:) = fprob(k,:)-next_ind; % so find does not fail
            jaux = find(abs(prob_temp(k,:))<=10^-15);
            
            % fix in case length(jaux)>1
            e = length(jaux); 
            contj = 1; % position counter of jaux          
            if e>1
                while contj<=e
                    if sum(fprob(k,1:jaux(contj)))>=nrand
                        jaux = jaux(contj);
                        break
                    else
                        contj = contj + 1;
                    end
                end
            end    
            pos = pos + 1;
            vsit_vert(k,pos) = jaux;  % add nex visited vertex         
            
            % is the route feasible until the moment? :          
            if sum(q(vsit_vert(k,1:pos)))<=Q 
                iaux = jaux; % That vertex will now be the new one from which it starts
                nonvsit_vert(nonvsit_vert == jaux) = []; % remove it from the unvisited
            else  
                vsit_vert(k,pos) = depot;
                break
            end
            
            [p,qd] = size(nonvsit_vert);   
            if qd == 1
                vsit_vert(k,pos+1) = nonvsit_vert;
                vsit_vert(k,pos+2) = depot;
                nonvsit_vert = [];
                break
            end           
        end

        if length(nonvsit_vert) == 0;
            break
        else
            k = k +1;
        end
    end
    
    % ------------------ K-path length -------------------------
    [s1,s2] = size(vsit_vert);
    if s1<num_Ants || length(nonvsit_vert)~=0
        iter = 1;
    else
        for k = 1:s1
            len_tour(k) = 0; 
            lng = length(find(vsit_vert(k,:)));
            for i = 1:lng-1
                len_tour(k) = len_tour(k) + len_mat(vsit_vert(k,i),vsit_vert(k,i+1));
            end        
        end
        temp_len(iter,:) = len_tour; % to find the vertices of the best tour found so far

        %----------------- Pheromone update --------------------    
        Lbs(iter) = min(len_tour); % to store the lengths of the best tour of each iteration
        sumi(iter) = sum(len_tour);
        Lbest = min(sumi(1:iter)); % length of the best tour so far
        niter = [];
        niter = find(sumi == Lbest); % iteration in which the best tour has been launched so far (we take one)
        % Best ant of all the iterations so far :
        best_tkant = find(abs(temp_len(niter(1),:)-Lbs(niter(1)))<=10^-15); % we take one
        % Calculate third term of expression (6) :
        posi1 = 0;
        tau_exact(1:n,1:n) = 0;

        best_antind1 = find(vsit_vert(best_tkant(1),:));
        for i = vsit_vert(best_tkant(1),best_antind1)
            posi1 = posi1 + 1;
            if posi1 == length(best_antind1)
                break
            end
            tau_exact(i,vsit_vert(best_tkant(1),posi1+1)) = 1/Lbest;
            tau_exact(vsit_vert(best_tkant(1),posi1+1),i) =  tau_exact(i,vsit_vert(best_tkant(1),posi1+1));
        end 

        % Calculate second term of expression (6) :
        sum_ktau(1:num_Ants,1:n,1:n) = 0;
        for k = 1:num_Ants        
            posi2 = 0;
            antind = find(vsit_vert(k,:));
            for i = vsit_vert(k,antind)
                posi2 = posi2 + 1;
                if posi2 == length(antind)
                    break
                end
                sum_ktau(k,i,vsit_vert(k,posi2+1)) = 1/len_tour(k);
                sum_ktau(k,vsit_vert(k,posi2+1),i) = sum_ktau(k,i,vsit_vert(k,posi2+1));   
            end
        end

        for i = 1:n
             for j = i+1:n
                 pher_mat(i,j) = rho*pher_mat(i,j) + sum(sum_ktau(1:num_Ants,i,j)) + sigma*tau_exact(i,j);          
                 pher_mat(j,i) = pher_mat(i,j);
             end
        end
        % uncomment if you want to see the iteration counter and the tours length of each iteration:  
        %                                 |
        %          disp('Iteracion:'),disp(num2str(iter))
        % disp(sum(len_tour))  % it is minimized little by little in each iteration
        
        iter = iter + 1;
    end 
end % end iteration loop

% best-tour --> sol (Output)
sol = sum(len_tour);

%------------------ Optimal route drawing ---------------
hold on
for k = 1:s1
    lengi(k) = length(find(vsit_vert(k,:)));
    for i = 1:lengi(k)
        X(k,i) = x(vsit_vert(k,i));
        Y(k,i) = y(vsit_vert(k,i));
    end
    plot(X(k,:),Y(k,:),'-','LineWidth',2)
end
plot(x(:,1),y(:,1),'o','LineWidth',2,'MarkerSize',8,'MarkerEdgeColor',...
    'b','MarkerFaceColor','g');
P1=[0 0];P2=[x(1) y(1)];
plot([P1(1) P2(1)],[P1(2) P2(2)],'w','LineWidth',2)
plot(x(:,2:n),y(:,2:n),'o','LineWidth',1,'MarkerSize',5,'MarkerEdgeColor',...
    'b','MarkerFaceColor','g');
axis([min(x)-5,max(x)+5,min(y)-5,max(y)+5])
hold off
end