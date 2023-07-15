package com.utp.modelo;

import java.util.List;

public interface CRUD <T>
{
    public abstract List<T> listar();			
    public abstract int insertar(T nuevo);                      
    public abstract int modificar(T modificado);                
    public abstract int eliminar(int eliminado);
}
