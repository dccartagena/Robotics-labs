classdef eslabonTrans<eslabon
    %Clase eslabon rotacional, aqui se resumen las propiedades
    %de un eslabon rotacional
    
    properties
        longitud_base = 1;
        Xeje_base = [0 0];
        Yeje_base = [0 0];
        
        longitud_eslabon = 1;
        Xeje_eslabon = [0 0];
        Yeje_eslabon = [0 0];
    end
    
    methods 
        function obj = eslabonTrans(varargin) 
            %Orden de entrada: angulo, long base, 
            %long eslabon, posicion
            
            obj.tipo = 'Traslacional';
            
            if isempty(varargin)
                obj.ang = 0;
                obj.longitud_base = 2;
                obj.longitud_eslabon = 1;
                obj.posicion = [0 0];
            else
                datos = cell2mat(varargin); %Se guardan los datos de entrada en una variable auxiliar
                obj.ang = deg2rad(datos(1));
                obj.longitud_base = datos(2);
                obj.longitud_eslabon = datos(3);
                obj.posicion = [datos(4) datos(5)];
            end
            
            obj.actualizareje();
        end
        
        function setlongesl(obj, long_eslabon)
            obj.longitud_eslabon = long_eslabon;  
            obj.actualizareje;
        end
        
        function setlongbase(obj, long_base)
            obj.longitud_base = long_base;
            obj.actualizareje;
        end
        
        function actualizareje(obj)
            obj.Xeje_eslabon = [obj.posicion(1) (obj.posicion(1) + (obj.longitud_base + obj.longitud_eslabon)*cos(obj.ang))];
            obj.Yeje_eslabon = [obj.posicion(2) (obj.posicion(2) + (obj.longitud_base + obj.longitud_eslabon)*sin(obj.ang))];
            
            obj.Xeje_base = [obj.posicion(1) (obj.posicion(1) + obj.longitud_base*cos(obj.ang))];
            obj.Yeje_base = [obj.posicion(2) (obj.posicion(2) + obj.longitud_base*sin(obj.ang))];
        end
    end
end

