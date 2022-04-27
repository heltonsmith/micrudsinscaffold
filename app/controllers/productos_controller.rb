class ProductosController < ApplicationController

    def index
        @productos = Producto.all
    end

    def destroy
        @productos = Producto.find(params[:id])
        if @productos.present?
            @productos.destroy
        end
        redirect_to "/"
    end

    def show 
        @productos = Producto.find(params[:id])
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

        #@restriccion = Producto.exists?(codigo: "111")
        #puts @restriccion
        #if @restriccion == false
            #if @productos.save 
                #redirect_to "/"
            #else
                #render :new
            #end
        #else
            #render :new
        #end    
    end

    private 
        def productos_params
            params.require(:producto).permit(:codigo, :nombre, :descripcion, :precio)
        end


end
