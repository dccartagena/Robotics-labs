classdef Robot < handle 
   %Clase robot como una suma de eslabones 
   %rotacionales y traslacionales
    
    properties
        eslabones = {};
        Nart = 0;
    end
    
    methods
        function obj = Robot(varargin)
            %Constructor de la clase Robot
            if isempty(varargin)
                obj.eslabones = {eslabonRot(30, 1, [0 0]) eslabonRot(60, 1, [1 0])};
            else
                obj.eslabones = varargin;
            end
            
            obj.Nart = size(obj.eslabones, 2);
            if obj.Nart>=2
                for i=2:obj.Nart
                    angFix = rad2deg(obj.eslabones{i-1}.ang + obj.eslabones{i}.ang);
                    obj.eslabones{i}.setang(angFix);
                end
            end
            
            obj.robotCheck();
        end
        
        function robotCheck(obj)
            %Se revisa que la unión de los eslabones esté en la posición
            %indicada
            for i=2:obj.Nart
                if (strcmp(obj.eslabones{i-1}.tipo, 'rotacional'))
                    obj.eslabones{i}.posicion = [obj.eslabones{i-1}.Xeje(2) obj.eslabones{i-1}.Yeje(2)];
                else
                    obj.eslabones{i}.posicion = [obj.eslabones{i-1}.Xeje_eslabon(2) obj.eslabones{i-1}.Yeje_eslabon(2)];
                end
                obj.eslabones{i}.actualizareje;
            end
        end
        
        function robotUP(obj, mov)
            %Se actualiza la posición del eslabón respecto al eslabón
            %anterior
            for i=1:obj.Nart
                if (strcmp(obj.eslabones{i}.tipo, 'rotacional'))
                    obj.eslabones{i}.setang(mov(i));
                else 
                    obj.eslabones{i}.setang(mov(i));
                    obj.eslabones{i}.setlongesl(mov(i + 1));
                end
                obj.eslabones{i}.actualizareje;
            end
            obj.robotCheck();
        end
        
    end
    
end

