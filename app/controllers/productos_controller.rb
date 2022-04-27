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
        @busqueda = Producto.find_by(codigo: productos_params[:codigo])

        if @busqueda.present?
            respond_to do |format|
                format.html { redirect_to "/productos/new", notice: "ERROR: Código duplicado" }
            end
        else
            @productos = Producto.new(productos_params)
            if @productos.save
                redirect_to "/"
            else
                render :new #redirect_to "/productos/new"
            end
        end
    end

    def edit 
        @productos = Producto.find(params[:id])
    end

    def update 
        @productos = Producto.find(params[:id])
        if @productos.update(productos_params)
            redirect_to "/" #productos_path
        else
            render :edit
        end
    end

    private 
        def productos_params
            params.require(:producto).permit(:codigo, :nombre, :descripcion, :precio)
        end


end
