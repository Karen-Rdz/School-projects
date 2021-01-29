Masa = 1;
grid on;
h = animatedline;
set(h, 'Color', 'b')
h2 = animatedline;
set(h2, 'Color', 'b')
set(h2,'LineStyle', '--')

l = animatedline;
set(l, 'Color', 'r')
l2 = animatedline;
set(l2, 'Color', 'r')
set(l2,'LineStyle', '--')

m = animatedline;
set(m, 'Color', 'g')
m2 = animatedline;
set(m2, 'Color', 'g')
set(m2,'LineStyle', '--')

K = input('Introduzca la K del proyectil 1: ');
vi=input('Introduzca la velocidad del proyectil 1: ');
Ang=input('Introduzca el angulo del proyectil 1: ');
K2 = input('Introduzca la K del proyectil 2: ');
vi2=input('Introduzca la velocidad del proyectil 2: ');
Ang2=input('Introduzca el angulo del proyectil 2: ');
K3 = input('Introduzca la K del proyectil 3: ');
vi3=input('Introduzca la velocidad del proyectil 3: ');
Ang3=input('Introduzca el angulo del proyectil 3: ');

dt=.1;
t=0:dt:60;
Y=0;
X=0;
A=-9.81;
X0 = 0;
Y0 = 2000;

Vx = vi*cos(Ang*pi/180);
Vy = vi*sin(Ang*pi/180);
Vx_2 = vi2*cos(Ang2*pi/180);
Vy_2 = vi2*sin(Ang2*pi/180);
Vx_3 = vi3*cos(Ang3*pi/180);
Vy_3 = vi3*sin(Ang3*pi/180);

Ay=(A-(K/Masa)*(vi)*(Vy));
Ax=-1*((vi*Vx)*(K/Masa));
Ay_2=(A-(K2/Masa)*(vi2)*(Vy_2));
Ax_2=-1*((vi2*Vx_2)*(K2/Masa));
Ay_3=(A-(K3/Masa)*(vi3)*(Vy_3));
Ax_3=-1*((vi3*Vx_3)*(K3/Masa));

delete(findall(gcf,'type','text'))
title(['Simulacion de ' num2str(3) ' proyectiles en tiro parabolico']);
xlabel('Distancia [m]')
ylabel('Altura [m]')
    
% Gráficas de Posiciones Ideales
for i= 1:length(t)
    X=X0+Vx*t;
    Y=Y0+Vy*t+0.5*(A)*(t.^2);
    num = text(0,1900,['Número de proyectil = ' num2str(1)]) ;
    alt = text(0,1800,['Altura = ' num2str(Y(i))]);
    pos = text(0,1700,['Posición = ' num2str(X(i))]);
    vel = text(0,1600,['Velocidad = ' num2str(Vy)]);
    if Y(i)<= 0
        break
    else
       addpoints(h, X(i), Y(i));
       drawnow
    end
    delete(findall(gcf,'type','text'))
    title(['Simulacion de ' num2str(3) ' proyectiles en tiro parabolico']);
    xlabel('Distancia [m]')
    ylabel('Altura [m]')
end

for i= 1:length(t)
    X_2=X0+Vx_2*t;
    Y_2=Y0+Vy_2*t+0.5*(A)*(t.^2);
    text(0,1900,['Número de proyectil = ' num2str(2)]) 
    text(0,1800,['Altura = ' num2str(Y_2(i))])
    text(0,1700,['Posición = ' num2str(X_2(i))])
    text(0,1600,['Velocidad = ' num2str(Vy_2)])
    if Y_2(i)<= 0
        break
    else
       addpoints(l, X_2(i), Y_2(i));
       drawnow
    end
    delete(findall(gcf,'type','text'))
    title(['Simulacion de ' num2str(3) ' proyectiles en tiro parabolico']);
    xlabel('Distancia [m]')
    ylabel('Altura [m]')
end

for i= 1:length(t)
    X_3=X0+Vx_3*t;
    Y_3=Y0+Vy_3*t+0.5*(A)*(t.^2);
    text(0,1900,['Número de proyectil = ' num2str(3)]) 
    text(0,1800,['Altura = ' num2str(Y_3(i))])
    text(0,1700,['Posición = ' num2str(X_3(i))])
    text(0,1600,['Velocidad = ' num2str(Vy_3)])
    if Y_3(i) <= 0 
        break
    else
        addpoints(m, X_3(i), Y_3(i));
        drawnow
    end
    delete(findall(gcf,'type','text'))
    title(['Simulacion de ' num2str(3) ' proyectiles en tiro parabolico']);
    xlabel('Distancia [m]')
    ylabel('Altura [m]')
end

X = 0;
Y = 2000;

% Gráfica de Posiciones con Resistencia del Aire
for i= 1:length(t)
    ax=-(K/Masa)*vi*Vx;
    ay=A-(K/Masa)*vi*Vy;
    Vx=Vx+ax*dt;
    Vy=Vy+ay*dt;
    X(i+1)=X(i)+Vx*dt+.5*ax*dt^2;
    Y(i+1)=Y(i)+Vy*dt+.5*ay*dt^2;
    text(0,1900,['Número de proyectil (Fricción) = ' num2str(1)]) 
    text(0,1800,['Altura = ' num2str(Y(i+1))])
    text(0,1700,['Posición = ' num2str(X(i+1))])
    text(0,1600,['Velocidad en y = ' num2str(Vy)])
    text(0,1500,['Velocidad en x = ' num2str(Vx)])
    vi = sqrt(Vx^2 + Vy^2);
    if Y(i+1)<= 0
        break
    end
    addpoints(h2, X(i), Y(i));
    drawnow
    delete(findall(gcf,'type','text'))
    title(['Simulacion de ' num2str(3) ' proyectiles en tiro parabolico']);
    xlabel('Distancia [m]')
    ylabel('Altura [m]')
end

X2 = 0;
Y2 = 2000;

for i= 1:length(t)
    ax_2=-(K2/Masa)*vi2*Vx_2;
    ay_2=A-(K2/Masa)*vi2*Vy_2;
    Vx_2=Vx_2+ax_2*dt;
    Vy_2=Vy_2+ay_2*dt;
    X2(i+1)=X2(i)+Vx_2*dt+.5*ax_2*dt^2;
    Y2(i+1)=Y2(i)+Vy_2*dt+.5*ay_2*dt^2;
    vi2 = sqrt(Vx_2^2 + Vy_2^2);
    text(0,1900,['Número de proyectil (Fricción) = ' num2str(2)]) 
    text(0,1800,['Altura = ' num2str(Y2(i+1))])
    text(0,1700,['Posición = ' num2str(X2(i+1))])
    text(0,1600,['Velocidad en y = ' num2str(Vy_2)])
    text(0,1500,['Velocidad en x = ' num2str(Vx_2)])
    if Y2(i+1)<= 0
        break
    end
    addpoints(l2, X2(i), Y2(i));
    drawnow
    delete(findall(gcf,'type','text'))
    title(['Simulacion de ' num2str(3) ' proyectiles en tiro parabolico']);
    xlabel('Distancia [m]')
    ylabel('Altura [m]')
end

X3 = 0;
Y3 = 2000;

for i= 1:length(t)
    ax_3=-(K3/Masa)*vi3*Vx_3;
    ay_3=A-(K3/Masa)*vi3*Vy_3;
    Vx_3=Vx_3+ax_3*dt;
    Vy_3=Vy_3+ay_3*dt;
    X3(i+1)=X3(i)+Vx_3*dt+.5*ax_3*dt^2;
    Y3(i+1)=Y3(i)+Vy_3*dt+.5*ay_3*dt^2;
    vi3 = sqrt(Vx_3^2 + Vy_3^2);
    text(0,1900,['Número de proyectil (Fricción) = ' num2str(3)]) 
    text(0,1800,['Altura = ' num2str(Y3(i+1))])
    text(0,1700,['Posición = ' num2str(X3(i+1))])
    text(0,1600,['Velocidad en y= ' num2str(Vy_3)])
    text(0,1500,['Velocidad en x= ' num2str(Vx_3)])
    if Y3(i+1)<= 0
        break
    end
    addpoints(m2, X3(i), Y3(i));
    drawnow
    delete(findall(gcf,'type','text'))
    title(['Simulacion de ' num2str(3) ' proyectiles en tiro parabolico']);
    xlabel('Distancia [m]')
    ylabel('Altura [m]')
end


