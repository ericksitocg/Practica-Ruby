#clase servicio
class Servicio
	def initialize(nombre,tarifa)
		@nombre = nombre
		@tarifa = tarifa
		@estado = false
	end

	def to_s
		"#{@nombre} #{@tarifa} #{@estado}"
	end

	#Metodos
	def get_nombre
		@nombre
	end

	def get_tarifa
		@tarifa
	end

	def actualizar_servicio
		puts "actulizando servicio"
	end

	def activar_servicio
		@estado = true
	end

	def desactivar_servicio
		@estado = false
	end

	def configurar_tarifa(n_tarifa)
		@tarifa = n_tarifa
	end

end
#clase Usuario
class Usuario
	def initialize(nombre,usuario,contrasenia)
		@nombre = nombre
		@usuario = usuario
		@contrasenia = contrasenia
	end

	def to_s
		"#{@nombre} #{@usuario} #{@contrasenia}"
	end

	#metodos

	def get_nombre
		@nombre
	end

	def loguear()
		puts "Logeando"
	end

	def actualizar_datos()
		puts "Estoy actulizando los datos"
	end

	def recuperar_contrasenia()
		puts "Recupertando contrasenia"
	end
end

#clase Cliente
class Cliente < Usuario
	def initialize(nombre,usuario,contrasenia)
		super(nombre,usuario,contrasenia)
		@aceptado = true
	end

	def to_s
		"#{@nombre} #{@usuario} #{@contrasenia} #{@aceptado}"
	end

	#metodos

	def solicitar_plataforma
		puts "Solicito una plataforma xD"
	end



end
#clase Proveedor
class Proveedor < Usuario
	def initialize(nombre,usuario,contrasenia)
		super(nombre,usuario,contrasenia)
		@servicios = Array.new
		@propuestas = Array.new
	end

	def to_s
		"#{@nombre} #{@usuario} #{@contrasenia} #{@servicios}"
	end

	#Metodos

	def agregar_servicio(nombre,tarifa)
		nuevo_servicio = Servicio.new(nombre,tarifa)
		@servicios << nuevo_servicio
		puts "Servicio " + nuevo_servicio.get_nombre + " creado"
	end

	def configurar_tarifa(servicio,tarifa)
		@servicios.each do |servicio_i|
			servicio_i.get_nombre <=> servicio
				servicio_i.configurar_tarifa(tarifa)
				puts "Servicio " + servicio_i.get_nombre + " ahora tiene tarifa " + servicio_i.get_tarifa
		end
	end
##############Cambio
	def aceptar_propuesta(servicio)
		servicio.activar_servicio
		puts "Acpetando la propuesta"
	end

	def desactivar_cuenta
		puts "Desactivando la cuenta"
	end
end

#Clase administrador
class Administrador < Usuario
	def initialize(nombre,usuario,contrasenia)
		super(nombre,usuario,contrasenia)
		@clientes = Array.new
		@proveedores = Array.new
		@servicios = Array.new
	end

	#Metodos

	def crear_cliente(nombre,usuario,contrasenia)
		nuevo_cliente = Cliente.new(nombre,usuario,contrasenia)
		@clientes <<nuevo_cliente
		puts "Cliente " + nuevo_cliente.get_nombre + " creado"
	end

	def crear_proveedor(nombre,usuario,contrasenia)
		nuevo_proveedor = Proveedor.new(nombre,usuario,contrasenia)
		@proveedores << nuevo_proveedor
		puts "Proveedor " + nuevo_proveedor.get_nombre + " creado"
	end

	def actualizar_datos_cliente(usuario)
		puts "Actualizando datos de un cliente especifico " + usuario
	end

	def actualizar_datos_proveedor(usuario)
		puts "Actualizando datos de un proveedor especifico " + usuario
	end

	def desactivar_cliente(usuario)
		@clientes.each do |cliente_i|
			cliente_i.get_nombre <=> usuario
				@clientes.delete(cliente_i)
				puts "Cliente " + usuario + " desactivado"
		end
	end

	def desactivar_proveedor(usuario)
		@proveedores.each do |proveedor_i|
			proveedor_i.get_nombre <=> usuario
				@proveedores.delete(proveedor_i)
				puts "Proveedor " + usuario + " desactivado"
		end
	end

	def crear_servicio(nombre,tarifa)
		nuevo_servicio = Servicio.new(nombre,tarifa)
		@servicios << nuevo_servicio
		puts "Servicio " + nuevo_servicio.get_nombre + " creado"
	end

end
#########################
administrador = Administrador.new("Erick","user","admin")
administrador.crear_cliente("Erick","ee","3")
administrador.crear_proveedor("prove","23","123")
administrador.desactivar_cliente("Erick")
administrador.crear_servicio("le",21)