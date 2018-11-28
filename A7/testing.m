% Testing.m - Script for testing the code for Assignment 7
% 
%
% Author:
%     Cade Parkison
%     UU
%     Fall 2018
%

car1 = VideoReader('car1.avi');
car2 = VideoReader('car2.avi');
car1_ = VideoReader('car1.avi');
car2_ = VideoReader('car2.avi');

bus1 = VideoReader('bus1.avi');
bus2 = VideoReader('bus2.avi');
bus1_ = VideoReader('bus1.avi');
bus2_ = VideoReader('bus2.avi');

truck1 = VideoReader('truck1.avi');
truck2 = VideoReader('truck2.avi');
truck1_ = VideoReader('truck1.avi');
truck2_ = VideoReader('truck2.avi');

%%%%%%%%%%%%%%%%%
% DATA Collection
%%%%%%%%%%%%%%%%%

% Car Training Data
M1 = CS6640_MM(car1);
M2 = CS6640_MM(car2);
c1_data = CS6640_object_data(M1,car1_);
c2_data = CS6640_object_data(M2,car2_);

% Truck Training Data
M3 = CS6640_MM(truck1);
M4 = CS6640_MM(truck2);
t1_data = CS6640_object_data(M3,truck1_);
t2_data = CS6640_object_data(M4,truck2_);

M5 = CS6640_MM(bus1);
M6 = CS6640_MM(bus2);
b1_data = CS6640_object_data(M5,bus1_);
b2_data = CS6640_object_data(M6,bus2_);

%%%%%%%%%%%%%%%%
% Data Filtering
%%%%%%%%%%%%%%%%

% Car
c1_objs = CS6640_data_collection(c1_data);
c2_objs = CS6640_data_collection(c2_data);

% Truck
t1_objs = CS6640_data_collection(t1_data);
t2_objs = CS6640_data_collection(t2_data);

% Bus
b1_objs = CS6640_data_collection(b1_data);
b2_objs = CS6640_data_collection(b2_data);

% Feature Vector Creation

% Car
car_samples = [c1_objs, c2_objs];
Xc = CS6640_feature_extraction(car_samples);

% Truck
truck_samples = [t1_objs, t2_objs];
Xt = CS6640_feature_extraction(truck_samples);

% Bus
bus_samples = [b1_objs, b2_objs];
Xb = CS6640_feature_extraction(bus_samples);


%%%%%%%%%%%%%%
% Build Models
%%%%%%%%%%%%%%

Mc = CS6640_build_Bayes(Xc);
Mt = CS6640_build_Bayes(Xt);
Mb = CS6640_build_Bayes(Xb);


%%%%%%%%%%%%%%%%%
% Plot Model Data
%%%%%%%%%%%%%%%%%
clf;
hold on;

x = linspace(-30000, 40000);

y1 = normpdf(x,Mc.mean, Mc.var);
y2 = normpdf(x,Mt.mean, Mt.var);
y3 = normpdf(x,Mb.mean, Mb.var);

plot(x,y1,'b','DisplayName','Car');
plot(x,y2,'r','DisplayName','Truck');
plot(x,y3,'g','DisplayName','Bus');


scatter(Mc.mean,0,'Marker','x','DisplayName','Car mean');
scatter(Mt.mean,0,'Marker','o','DisplayName','Truck mean');
scatter(Mb.mean,0,'Marker','*','DisplayName','Bus mean');
     
legend()
       
%xlabel('x')
%ylabel('f(x|mu,sigma)')
title('Probability Distributions of each Class')


%%%%%%%%%%%%%%%%%%
% Model Evaluation
%%%%%%%%%%%%%%%%%%

% Training Data Evaluation
cp = [1/3  1/3  1/3];
cm = [Mc Mt Mb];

c_classes_t = CS6640_bayes_eval(Xc, cp, cm);
t_classes_t = CS6640_bayes_eval(Xt, cp, cm);
b_classes_t = CS6640_bayes_eval(Xb, cp, cm);

car = ones([length(Xc), 1]);
truck = 2*ones([length(Xt), 1]);
bus = 3*ones([length(Xb), 1]);

sum(c_classes_t == car)/length(Xc)
sum(c_classes_t==1)
sum(c_classes_t==2)
sum(c_classes_t==3)

sum(t_classes_t == truck)/length(Xt)
sum(t_classes_t==1)
sum(t_classes_t==2)
sum(t_classes_t==3)

sum(b_classes_t == bus)/length(Xb)
sum(b_classes_t==1)
sum(b_classes_t==2)
sum(b_classes_t==3)


% Test Data Evaluation

c3 = VideoReader('car3.avi');
t3 = VideoReader('truck3.avi');
b3 = VideoReader('bus3.avi');
c3_ = VideoReader('car3.avi');
t3_ = VideoReader('truck3.avi');
b3_ = VideoReader('bus3.avi');

MMc = CS6640_MM(c3);
MMt = CS6640_MM(t3);
MMb = CS6640_MM(b3);

% Car
c3_data = CS6640_object_data(MMc,c3_);
c3_objs = CS6640_data_collection(c3_data);
Xc3 = CS6640_feature_extraction(c3_objs);

% Truck
t3_data = CS6640_object_data(MMt,t3_);
t3_objs = CS6640_data_collection(t3_data);
Xt3 = CS6640_feature_extraction(t3_objs);

% Bus
b3_data = CS6640_object_data(MMb,b3_);
b3_objs = CS6640_data_collection(b3_data);
Xb3 = CS6640_feature_extraction(b3_objs);

c3_classes = CS6640_bayes_eval(Xc3, cp, cm);
t3_classes = CS6640_bayes_eval(Xt3, cp, cm);
b3_classes = CS6640_bayes_eval(Xb3, cp, cm);

car3 = ones([length(Xc3), 1]);
truck3 = 2*ones([length(Xt3), 1]);
bus3 = 3*ones([length(Xb3), 1]);

sum(c3_classes == car3)/length(Xc3)
sum(c3_classes == 1)
sum(c3_classes == 2)
sum(c3_classes == 3)

sum(t3_classes == truck3)/length(Xt3)
sum(t3_classes == 1)
sum(t3_classes == 2)
sum(t3_classes == 3)

sum(b3_classes == bus3)/length(Xb3)
sum(b3_classes == 1)
sum(b3_classes == 2)
sum(b3_classes == 3)




























