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

	def get_estado
		@estado
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
		@aceptado = false
	end

	def to_s
		"#{@nombre} #{@usuario} #{@contrasenia} #{@aceptado}"
	end

	#metodos

	def solicitar_plataforma(proveedor,servicio)
		proveedor.
	end

	def cambiar_estado_aceptado
		@aceptado = true
	end

	def cambiar_estado_negado
		@aceptado = false
	end

	def get_estado
		@aceptado
	end

	def enviar_propuesta(proveedor,servicio)
		propuesta = Propuesta.new(self,servicio)
		proveedor.recibir_propuesta(propuesta)
	end
end
#clase propuesta
class Propuesta
	def initialize(cliente,servicio)
		@cliente = cliente
		@servicio = servicio
	end

	def aceptar
		@servicio.activar_servicio
		@cliente.cambiar_estado_aceptado
		puts "Cliente " + cliente + " " + cliente.getEstado + " con servicio " + servicio.getEstado
	end

	def rechazar
		@servicio.desactivar_servicio
		@cliente.cambiar_estado_negado
		puts "Cliente " + cliente + " " + cliente.getEstado + " con servicio " + servicio.getEstado
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

	def agregar_servicio(nuevo_servicio)
		@servicios << nuevo_servicio
		puts "Servicio " + nuevo_servicio.get_nombre + " creado"
	end

	def configurar_tarifa(servicio,tarifa)
		servicio.configurar_tarifa(tarifa)
		puts "Servicio " + servicio.get_nombre + " actualizado a tarifa " + servicio.get_tarifa
	end
##############Cambio

	def recibir_propuesta(propuesta)
		@propuestas << propuesta
	end

	def aceptar_propuesta(propuesta)
		propuesta.aceptar
	end

	def negar_propuesta(propuesta)
		propuesta.rechazar
	end

	def desactivar_cuenta(cliente)
		@clientes.each do |cliente_i|
			cliente_i.get_nombre <=> usuario
				@clientes.delete(cliente_i)
				puts "Cliente " + usuario + " desactivado"
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