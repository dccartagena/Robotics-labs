classdef eslabon < handle
    %La clase eslabon resume las principales propiedades
    %de un eslabon en un robot manipulador
    
    properties
        tipo = '';
        ang = 0;
        posicion = [0 0];
    end
    
    methods
%         gettipo(obj);
%         setang(obj, angulo);
%         getang(obj);
%         setposicion(obj, position);
%         getposicion(obj);
        function obj = eslabon
            obj.tipo = '';
            obj.ang = 0;
            obj.posicion = [0 0];
        end
        
        function setang(obj, angulo)
            obj.ang = degtorad(angulo);
            obj.actualizareje;
        end
        
        function setposicion(obj, position)
            obj.posicion = position;
            obj.actualizareje;
        end
        
        function gettipo(obj)
            disp(['El robot es tipo ' obj.tipo]);
        end
        
        function getang(obj)
            disp(['El angulo actual del robot es ' num2str(obj.ang)]);
        end
        
        function getposicion(obj)
            disp(['La posición actual del robot es ' num2str(obj.posicion)]);
        end
        
        function getejes(obj)
            disp(['La posición actual del robot en eje X es ' num2str(obj.Xeje)]);
            disp(['La posición actual del robot en eje Y es ' num2str(obj.Yeje)]);
        end
    end
    
    
end

