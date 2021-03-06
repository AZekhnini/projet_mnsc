% Initialisation du vecteur direction souhait�e
global  FXN FYN MX2 MY2 Xmin Ymin Xmax Ymax  Nb_objets  ph q
D_ant=D_S;
D_S = zeros(3*Nb_objets,1); 
for i=1:Nb_objets
    
                nc=abs(round((q(3*i-2)-Xmin)/ph));
                nl=abs(round((q(3*i-1))/ph));
                          
           indX=nc;
           indY=nl;
% Affectation de la direction souhait�e
       if Code(i)==1
            s1=true(FXN1(indY,indX)~=0);
            s2=true(FYN1(indY,indX)~=0);
            if s1+s2~=0
                D_S(3*i-2) = -FXN1(indY,indX);
                D_S(3*i-1) = -FYN1(indY,indX);
            else 
               [s,t] = find(Dist1(nl-1:nl+1,nc-1:nc+1) == min(min(Dist1(nl - 1:nl + 1,nc - 1:nc + 1))));
               
                    ss = nl+(s(1) - 2);
                    tt = nc+(t(1) - 2);
                    x = tt*ph;
                    y=ss(1)*ph;
                    D_S(3*i-2:3*i-1)=-(q(3*i-2:3*i-1)-[x;y])/norm(q(3*i-2:3*i-1)-[x;y]);
            end
       elseif Code(i)==2
            s1=true(FXN1(indY,indX)~=0);
            s2=true(FYN1(indY,indX)~=0);
            if s1+s2~=0
                D_S(3*i-2)=-FXN1(indY,indX);
                D_S(3*i-1)=-FYN1(indY,indX);
           else 
              [s,t]=find(Dist2(nl-1:nl+1,nc-1:nc+1)==min(min(Dist2(nl-1:nl+1,nc-1:nc+1))));
                   ss=nl+(s(1)-2);
                   tt=nc+(t(1)-2);
                   x=tt*ph;
                   y=ss(1)*ph;
                   D_S(3*i-2:3*i-1)=-(q(3*i-2:3*i-1)-[x;y])/norm(q(3*i-2:3*i-1)-[x;y]);
            end
       end
end