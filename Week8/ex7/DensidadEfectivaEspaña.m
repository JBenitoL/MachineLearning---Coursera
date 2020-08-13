RangosPoblacion = [80 250 750 1500 2500 4000 7500 15000 25000 40000 75000 250000 500000 ];

MunicipiosComunidades(1,:) = [973 2855 1065 943 531 485 547 348 137 91 76 53 6];
MunicipiosComunidades(2,:) = [2 95 92 118 101 106 111 71 33 13 16 10 2];
MunicipiosComunidades(3,:) = [145 385 87 55 20 18 8 8 1 2 0 0 1];
MunicipiosComunidades(4,:) = [0 5 11 16 7 8 10 14 1 3 1 2 0];
MunicipiosComunidades(5,:) =  [0 2 6 7 7 11 12 12 5 4 0 1 0];
MunicipiosComunidades(6,:) = [0 0 1 6 7 6 27 18 7 8 4 3 0];
MunicipiosComunidades(7,:) = [2 14 15 27 16 10 7 7 1 1 1 1 0];
MunicipiosComunidades(8,:) = [491 1209 280 140 40 34 30 9 3 3 5 4 0];
MunicipiosComunidades(9,:) = [191 309 130 109 61 51 35 19 5 2 6 1 0];
MunicipiosComunidades(10,:) = [23 324 149 116 75 62 86 51 21 16 13 9 1];
MunicipiosComunidades(11,:) = [23 118 84 85 47 37 52 40 30 13 9 3 1];
MunicipiosComunidades(12,:) = [4 98 92 86 40 23 25 8 1 3 2 1 0];
MunicipiosComunidades(13,:) = [0 1 14 72 43 66 62 35 11 4 4 3 0];
MunicipiosComunidades(14,:) = [4 30 20 21 16 14 32 14 3 8 8 8 1];
MunicipiosComunidades(15,:) = [0 0 2 4 1 2 8 13 6 5 2 2 0];
MunicipiosComunidades(16,:) = [35 119 33 27 24 15 11 5 1 1 0 1 0];
MunicipiosComunidades(17,:) = [3 64 37 44 18 18 27 22 7 5 3 3 0];
MunicipiosComunidades(18,:) = [50 82 12 10 8 4 4 2 1 0 0 1 0];
MunicipiosComunidades(19,:) = [0 0 0 0 0 0 0 0 0 0 1 0 0];
MunicipiosComunidades(20,:) = [0 0 0 0 0 0 0 0 0 0 1 0 0];

SuperficieTotal= [505987 87597	 47720 10604  4992 7447 5321 94223 79463 32114 23255 41634 29574 8100 11313 10391 7234 5045 19 13];

Poblacion = [47026208.0 8414240.0 1319291.0 1022800.0 1149460.0 2153389.0 581078.0 2399548.0 2032863.0 7675217.0 ...
    5003769.0 1067710.0 2699499.0 6663394.0 1493898.0 654214.0 2207776.0 316798.0 84777.0 86487.0];


%%
SuperfMedia = SuperficieTotal./sum(MunicipiosComunidades,2)';
for j =0:30

Threshold = j*2;

for i =1:20
    PorcenPoblacion =100*cumsum(RangosPoblacion.*MunicipiosComunidades(i,:))/sum((RangosPoblacion.*MunicipiosComunidades(i,:)));
    
    [~, index(i)] = min(abs(PorcenPoblacion - Threshold));
    
    PoblacionPocoDensa = sum(RangosPoblacion(1:index(i)).*MunicipiosComunidades(i,1:index(i)));
    PoblacionEfectiva = Poblacion(i)-PoblacionPocoDensa;
    
    SuperficiePocoDensa = sum(MunicipiosComunidades(i,1:index(i))*SuperfMedia(i))
    SuperficieEfectiva = SuperficieTotal(i)-SuperficiePocoDensa;
    SuperficieEfectivaN = sum(MunicipiosComunidades(i,index(i):end)*SuperfMedia(i))
    
    DensidadEfectiva(i,1)= PoblacionEfectiva/SuperficieEfectiva;
    DensidadEfectiva(i,2)= PoblacionEfectiva/SuperficieEfectivaN;
    DensidadEfectiva(i,3) = Poblacion(i)/SuperficieTotal(i)
    
end
Com = 18;
Evolucion(j+1,1)= Threshold;
Evolucion(j+1,2)= DensidadEfectiva(Com,1);
Evolucion(j+1,3)= DensidadEfectiva(Com,2);
end
figure(30)
plot(Evolucion(:,1), Evolucion(:,2), '.-')
hold on
plot(Evolucion(:,1), Evolucion(:,3), '.-')

%DensidadEfectiva(:,4) = DensidadEfectiva(:,1)./DensidadEfectiva(:,3)
%DensidadEfectiva(:,5) = DensidadEfectiva(:,2)./DensidadEfectiva(:,3)
%%

SuperfMedia = SuperficieTotal./sum(MunicipiosComunidades,2)';
Threshold = 250*SuperfMedia;    

for i =1:20
  
    [~, index(i)] = min(abs(RangosPoblacion - Threshold(i)));
   
    PoblacionPocoDensa = sum(RangosPoblacion(1:index(i)).*MunicipiosComunidades(i,1:index(i)));
    PoblacionEfectiva = Poblacion(i)-PoblacionPocoDensa;
    
    SuperficiePocoDensa = sum(MunicipiosComunidades(i,1:index(i))*SuperfMedia(i))
    SuperficieEfectiva = SuperficieTotal(i)-SuperficiePocoDensa;
    SuperficieEfectivaN = sum(MunicipiosComunidades(i,index(i):end)*SuperfMedia(i))
    
    DensidadEfectiva(i,1)= PoblacionEfectiva/SuperficieEfectiva;
    DensidadEfectiva(i,2)= PoblacionEfectiva/SuperficieEfectivaN;
    DensidadEfectiva(i,3) = Poblacion(i)/SuperficieTotal(i)
    
end

DensidadEfectiva(:,4) = DensidadEfectiva(:,1)./DensidadEfectiva(:,2)
