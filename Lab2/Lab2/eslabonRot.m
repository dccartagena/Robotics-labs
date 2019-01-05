classdef eslabonRot<eslabon
    %Clase eslabon rotacional, aqui se resumen las propiedades
    %de un eslabon rotacional
    
    properties
        longitud = 1;
        Xeje = [0 0];
        Yeje = [0 0];
    end
    
    methods 
        function obj = eslabonRot(varargin)
            %Orden de entrada: angulo, longitud, posicion
            obj.tipo = 'rotacional';

            if isempty(varargin)
                obj.ang = 0;
                obj.longitud = 1;
                obj.posicion = [0 0];
            else
                datos = cell2mat(varargin); %Se guardan los datos de entrada en una variable auxiliar
                obj.ang = deg2rad(datos(1));
                obj.longitud = datos(2);
                obj.posicion = [datos(3) datos(4)];
            end
            
            obj.actualizareje;
        end
        
        function setlong(obj, long)
            obj.longitud = long;  
            obj.actualizareje;
        end
        
        function actualizareje(obj)
            obj.Xeje = [obj.posicion(1) (obj.posicion(1) + obj.longitud*cos(obj.ang))];
            obj.Yeje = [obj.posicion(2) (obj.posicion(2) + obj.longitud*sin(obj.ang))]; 
        end
    end
end

