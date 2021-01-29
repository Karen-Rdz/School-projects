clear all;
clc;
opcion = input('Escribe 1 para ver las gráficas, 2 Carro siguiendo la curva y 3 Carro cuando ocurre derrape: ');

% Calcular los coeficientes de la función cúbica
Coefx = 300:2800; 
yy = [2300;3000;-1000;200];
xx = [300;1100;1900;2800]; 
x1=xx(1); x2=xx(2); x3=xx(3); x4=xx(4); 
Matrix = [x1*x1*x1 x1*x1 x1 1;...
          x2*x2*x2 x2*x2 x2 1;...
          x3*x3*x3 x3*x3 x3 1;...
          x4*x4*x4 x4*x4 x4 1;]; 
Coef = Matrix\yy; 

if opcion == 3
    h = animatedline;
    set(h, 'Marker', 'o');
    x_animated = [300: 2800];
    y_animated = (Coef(1)*x_animated.^3) + (Coef(2)*x_animated.^2) + (Coef(3).*x_animated) + Coef(4);
    Radios = [];
    VelocidadMaxima = [];
    g = 9.81;
    mu = 0.7;
    for index = 1:length(x_animated)
        Radios(index) = ((1 + ((3*Coef(1)*index^2) + (2*Coef(2)*index) + Coef(3))^2)^(3/2))/ abs((6*Coef(1)*index) + 2*Coef(2));  
        VelocidadMaxima(index) = (sqrt(g*mu*Radios(index))*3600)/1000;
    end
    
    axis([300, 2800, -3000, 5000])
    y_pendiente_animated = [];
    derrape = false;
    for i = 1:length(x_animated)
        if(Radios(i) > 100) && derrape == false
            addpoints(h, x_animated(i), y_animated(i));
            text(1000,4500,['Velocidad Máxima = ' num2str(VelocidadMaxima(i))]);
            drawnow;
            clearpoints(h);
            delete(findall(gcf,'type','text'))
        else
            derrape = true;
            y_pendiente_animated(i) = 0.536224024967263*x_animated(i) + 3430.91344301034;
            addpoints(h, x_animated(i), y_pendiente_animated(i));
            text(1000,4500,['OCURRIO DERRAPE']);
            drawnow;
            clearpoints(h);
            delete(findall(gcf,'type','text'))
        end
    end
    
end

if(opcion == 2)
    h = animatedline;
    set(h, 'Marker', 'o');
    x_animated = [300: 2800];
    y_animated = (Coef(1)*x_animated.^3) + (Coef(2)*x_animated.^2) + (Coef(3).*x_animated) + Coef(4);
    Radios = [];
    VelocidadMaxima = [];
    g = 9.81;
    mu = 0.7;
    for index = 1:length(x_animated)
        Radios(index) = ((1 + ((3*Coef(1)*index^2) + (2*Coef(2)*index) + Coef(3))^2)^(3/2))/ abs((6*Coef(1)*index) + 2*Coef(2));  
        VelocidadMaxima(index) = (sqrt(g*mu*Radios(index))*3600)/1000;
    end
    
    axis([300, 2800, -3000, 5000])
    for i = 1:length(x_animated)  
        addpoints(h, x_animated(i), y_animated(i));
        text(1000,4500,['Velocidad Máxima = ' num2str(VelocidadMaxima(i))]);
        drawnow;
        clearpoints(h);
        delete(findall(gcf,'type','text'))
    end
end

if opcion == 1
    % Función que modela la curva de la pista
    x = sym('x');
    funcion = @(x) (Coef(1)*x^3) + (Coef(2)*x^2) + (Coef(3)*x) + Coef(4);
    y = funcion(x);

    % Graficar la curva
    x_all = [300, 2800];
    fplot(funcion, x_all, 'DisplayName','Curva');
    hold on;

    % Coordenadas de las gradas, calculadas previamente en el Avance 1
    x_gradas_max = [641.58886 634.51779 704.51773 711.5888];
    y_gradas_max = [3796.658 3803.7290678 3841.2640678 3834.193];
    x_gradas_min = [2216.10886 2209.03779 2279.03779 2286.1088];
    y_gradas_min = [-1912.102135 -1919.1732 -1951.26906 -1944.198];

    % Gráficar las gradas
    gradas_max = polyshape(x_gradas_max, y_gradas_max);
    gradas_min = polyshape(x_gradas_min, y_gradas_min);
    plot(gradas_max, 'DisplayName','Gradas Máximo');
    plot(gradas_min, 'DisplayName','Gradas Mínimo');
    hold on;

    % Graficar las pendientes previamente calculadas en el Avance 1
    x_pendiente_max = [500, 900];
    x_pendiente_min = [2000, 2500];
    y_pendiente_max = @(x) 0.536224024967263*x + 3430.91344301034;
    y_pendiente_min = @(x) -0.459824882459388*x - 872.45869376475;
    fplot(y_pendiente_max, x_pendiente_max, 'DisplayName','Pendiente Máximo', 'LineStyle', '--');
    fplot(y_pendiente_min, x_pendiente_min, 'DisplayName','Pendiente Mïnimo', 'LineStyle', '--');
    hold on;

    % Graficar puntos de derrape
    plot(690.7310, 3801.272625, '*', 'DisplayName','Derrape Máximo');
    plot(2265.251,-1914.0909, '*', 'DisplayName','Derrape Mínimo');
    legend
    title('Vista Curva Completa');
    hold on;
    
    % Longitd de la curva
    raiz = @(x) sqrt(1 + ((3*Coef(1)*x.^2) + (2*Coef(2)*x) + Coef(3)).^2);
    integral1 = integral(raiz, Coefx(1), Coefx(end));
    
    % Textos
    text(600,2400,['Punto inicial (300, 2300)']);
    text(600, 2200, ['Punto final (2800, 200)']);
    text(600, 2000, ['Longitud de la curva: ' num2str(integral1)]);
    text(600, 1800, ['Punto máximo (728.4116, 3811.1535)']);
    text(600, 1600, ['Punto mínimo (2297.8339, -1909.6071)']);
    text(600, 1400, ['Punto de derrape mínimo (2265.251,-1914.0909)']);
    text(600, 1200, ['Punto de derrape máximo (690.7310,3801.272625)']);

    % Graficar ampliaciones de las curvas
    box on;
    axes('Position', [.20 .20 .25 .25])
    x_pendiente_max_ampli = [620, 780];
    plot(gradas_max, 'DisplayName','Gradas Máximo'); hold on;
    plot(690.7310, 3801.272625, '*', 'DisplayName','Derrape Máximo'); hold on;
    fplot(y_pendiente_max, x_pendiente_max_ampli, 'DisplayName','Pendiente máximo', 'LineStyle', '--'); hold on;
    fplot(funcion, x_pendiente_max_ampli, 'DisplayName','Curva'); hold on;
    axis([620, 780, 3730, 3870])
    title('Ampliación Curva Máximo');
    legend

    box on;
    axes('Position', [.55 .55 .25 .25])
    x_pendiente_min_ampli = [2200, 2360];
    plot(gradas_min, 'DisplayName','Gradas Mínimo'); hold on;
    plot(2265.251,-1914.0909, '*', 'DisplayName','Derrape Mínimo'); hold on;
    fplot(y_pendiente_min, x_pendiente_min_ampli, 'DisplayName','Pendiente Mínimo', 'LineStyle', '--'); hold on;
    fplot(funcion, x_pendiente_min_ampli, 'DisplayName','Curva'); hold on;
    axis([2200, 2360, -1960, -1840])
    title('Ampliación Curva Mínimo');
    legend
    
end

