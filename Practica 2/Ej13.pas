{13. Una compañía aérea dispone de un archivo maestro donde guarda información sobre sus
próximos vuelos. En dicho archivo se tiene almacenado el destino, fecha, hora de salida y la
cantidad de asientos disponibles. La empresa recibe todos los días dos archivos detalles
para actualizar el archivo maestro. En dichos archivos se tiene destino, fecha, hora de salida
y cantidad de asientos comprados. Se sabe que los archivos están ordenados por destino
más fecha y hora de salida, y que en los detalles pueden venir 0, 1 ó más registros por cada
uno del maestro. Se pide realizar los módulos necesarios para:
a. Actualizar el archivo maestro sabiendo que no se registró ninguna venta de pasaje
sin asiento disponible.
b. Generar una lista con aquellos vuelos (destino y fecha y hora de salida) que
tengan menos de una cantidad específica de asientos disponibles. La misma debe
ser ingresada por teclado.
NOTA: El archivo maestro y los archivos detalles sólo pueden recorrerse una vez.}
program Ej13;
const
    corte = 9999;
type
    vuelo = record
        destino: string;
        fecha: string;
        horaSalida: integer;
        asientosDisp: integer;
    end;

    vueloDetalle = record
        destino: string;
        fecha: string;
        horaSalida: integer;
        asientosComprados: integer;
    end;

    vueloLista = record
        destino: string;
        fecha: string;
        horaSalida: integer;
    end;

    lista = ^nodo;

    nodo = record
        elem: vueloLista;
        sig: lita;
    end;

    maestro = file of vuelo;

procedure AgregarAtras(var L, K: lista; v: vuelo);
var
    aux: lista;
begin
    new(aux);
    aux^.elem.destino:= v.destino;
    aux^.elem.fecha:= v.fecha;
    aux^.elem.horaSalida:= v.horaSalida;
    aux^.sig:= nil;
    if (L = nil) then
        L:= aux;
    else
        K^.sig:= aux;
    K:= aux;
end;