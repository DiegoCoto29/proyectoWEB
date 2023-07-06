package com.tienda.service;

import com.tienda.domain.Producto;
import java.util.List;

public interface ProductoService {
    
    //se declara un metodo para obtener un arraylist de objetos producto
    //los objetos vienen de la tabla producto...
    //son todos los registros o solo activos
    
    public List<Producto> getProductos(boolean activos);
    
    //abaj0 se colocaran los metodos para un crud de productos... semana 6
    // Se obtiene un Producto, a partir del id de un producto
    public Producto getProducto(Producto producto);
    
    // Se inserta un nuevo producto si el id del producto esta vacío
    // Se actualiza un producto si el id del producto NO esta vacío
    public void save(Producto producto);
    
    // Se elimina el producto que tiene el id pasado por parámetro
    public void delete(Producto producto);
}
