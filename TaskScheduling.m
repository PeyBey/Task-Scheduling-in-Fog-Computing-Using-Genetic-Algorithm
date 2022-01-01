
clc;
clear;
close all;

%% Problem Definition
SensorNum=20;
FogNum=5;
FogClusterNum=3;
F=CreatFog(FogNum);
S=CreatSensor(SensorNum);
VarSize = [FogNum SensorNum];   % Decision Variables Matrix Size

%% GA Parameters

MaxIt = 30;	% Maximum Number of Iterations

nPop =50;	% Population Size

pc = 0.8;                 % Crossover Percentage
nc = 2*round(pc*nPop/2);  % Number of Offsprings (also Parnets)

pm = 0.4;                 % Mutation Percentage
nm = round(pm*nPop);      % Number of Mutants
mu = 0.05;                % Mutation Rate


UseRandomSelection =true; 

pause(0.01); 
Best_Orchestration=[];
%% Initialization
for step=1:1
S=CreatTask(S,1);
for i=1:length(S)
    Tasks(i)=S{i}.Tasks;
end
empty_individual.Position = [];
empty_individual.Cost = [];

pop = repmat(empty_individual, nPop, 1);

for i = 1:nPop
    
    % Initialize Position
    pop(i).Position = randerr(SensorNum,FogNum)';
    
    % Evaluation
    pop(i).Cost = NetworkModel(pop(i).Position,S,F,Tasks);    %% Apply cost function(in this case this is the aformentioned fog model)
    
end

% Sort Population
Costs = [pop.Cost];
[Costs, SortOrder] = sort(Costs,'descend');
pop = pop(SortOrder);

% Store Best Solution
BestSol = pop(1);

% Array to Hold Best Cost Values
BestCost = zeros(MaxIt, 1);

% Store Cost
WorstCost = pop(end).Cost;

%% Main Loop

for it = 1:MaxIt
    

    % Crossover
    popc = repmat(empty_individual, nc/2, 2);
    for k = 1:nc/2
   
        i1 = randi([1 nPop]);
        i2 = randi([1 nPop]);
        %         end
        
        % Select Parents
        p1 = pop(i1);
        p2 = pop(i2);
        
        % Perform Crossover
        [popc(k, 1).Position, popc(k, 2).Position] =MyCrossOver(p1.Position, p2.Position);
        
        % Evaluate Offsprings
        
        popc(k, 1).Cost = NetworkModel(popc(k,1).Position,S,F);
        popc(k, 2).Cost = NetworkModel(popc(k,2).Position,S,F);
        
    end
    popc = popc(:);
    
    
    % Mutation
    popm = repmat(empty_individual, nm, 1);
    for k = 1:nm
        
        % Select Parent
        i = randi([1 nPop]);
        p = pop(i);
        
        % Perform Mutation
        popm(k).Position = Mutate(p.Position, VarSize(1),VarSize(2));
        
        % Evaluate Mutant
        popm(k).Cost = NetworkModel(pop(k).Position,S,F);
        
    end
    
    % Create Merged Population
    pop = [pop
        popc
        popm]; %#ok
    
    % Sort Population
    Costs = [pop.Cost];
    [Costs, SortOrder] = sort(Costs,'descend');
    pop = pop(SortOrder);
    
    % Update Worst Cost
    WorstCost = max(WorstCost, pop(end).Cost);
    
    % Truncation
    pop = pop(1:nPop);
    Costs = Costs(1:nPop);
    
    % Store Best Solution Ever Found
    BestSol = pop(1);
    
    % Store Best Cost Ever Found
    BestCost(it) = BestSol.Cost;
    
    % Show Iteration Information
    disp(['Iteration ' ,num2str(it) ])
    
end

%% Results
[cost_func,total_cost(step),make_span(step),total_distance(step)]=NetworkModel(BestSol.Position,S,F)
[rx,cx]=size(BestSol.Position);
Best_Nodes_For_Tasks=ChromosomeEncoding(BestSol.Position,rx,cx);
Best_Orchestration(step,:)=Best_Nodes_For_Tasks;
disp(['Best Nodes For Task ' ,num2str(step), '  is: ' ,num2str(Best_Nodes_For_Tasks)]);

PlotFogCluser(F,S,Best_Nodes_For_Tasks,step)
pause(1)
norm_cost=normalize(BestCost,'range');
figure(20+step);
plot(norm_cost, 'LineWidth', 2);
xlabel('Iteration');
ylabel('Cost');
title(['Cost function for task: ',num2str(step)])
grid on;
hold on
end