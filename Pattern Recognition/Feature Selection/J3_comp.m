function J3=J3_comp(Sw,Sm) 
J3=trace(pinv(Sw)*Sm);