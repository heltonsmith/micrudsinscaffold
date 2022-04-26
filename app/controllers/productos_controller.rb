class ProductosController < ApplicationController

    def index
        @productos = Producto.all
    end

    def new 
        @productos = Producto.new
    end

    def create
        @productos = Producto.new(productos_params)
        if @productos.save 
            redirect_to "/"
        else
            render :new
        end
    end

    private 
        def productos_params
            params.require(:producto).permit(:codigo, :nombre, :descripcion, :precio)
        end


end
