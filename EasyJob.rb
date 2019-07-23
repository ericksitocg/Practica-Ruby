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
		propuesta = Propuesta.new(servicio)
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

	def menu
		#########################
		#L_op = ["1","2","3","4","5","6","7","8"]
		op = ""

		while !op.eql?"8" do

			puts "ADMINISTRACION"

			puts "Clientes registrados --" 
			puts @clientes
			puts "Proveedores registrados --" 
			puts @proveedores
			puts "Servicios registrados --" 
			puts @servicios

			puts "MENU"

			puts "1)Crear cliente"
			puts "2)Crear proveedor"
			puts "3)Crear servicio"
			puts "4)Actualizar datos cliente"
			puts "5)Actualizar datos proveedor"
			puts "6)Desactivar cliente"
			puts "7)Desactivar proveedor"
			puts "8)Salir"

			op= gets.to_s
			op = op[0]

			puts ""

			if op=="1"
				puts "=>Crear cliente"
				puts "Ingrese nombre del cliente"
				nombre_cliente = gets
				nombre_cliente = nombre_cliente[0.. nombre_cliente.length-2]
				puts "Ingrese el usuario del cliente"
				usuario_cliente = gets
				usuario_cliente = usuario_cliente[0..usuario_cliente.length-2]
				puts "Ingrese la contraseña del cliente"
				usuario_contrasenia = gets
				usuario_contrasenia = usuario_contrasenia[0 .. usuario_contrasenia.length-2]
				cliente = Cliente.new(nombre_cliente,usuario_cliente,usuario_contrasenia)
				@clientes << cliente
			end

			if op=="2"
				puts "=>Crear proveedor"
				puts "Ingrese nombre del proveedor"
				nombre_provedor = gets
				nombre_provedor = nombre_provedor[0 .. nombre_provedor.length-2]

				puts "Ingrese usuario del proveedor"
				usuario_proveedor = gets
				usuario_proveedor = usuario_proveedor[0 .. usuario_proveedor.length-2]

				puts "Ingrese contraseña del proveedor"
				contrasenia_proveedor = gets
				contrasenia_proveedor = contrasenia_proveedor[0 .. contrasenia_proveedor.length-2]

				proveedor = Proveedor.new(nombre_provedor,usuario_proveedor,contrasenia_proveedor)
				@proveedores << proveedor
			end

			if op=="3"
				puts "=>Crear servicio"
			end

			if op=="4"
				puts "=>Actualizar datos cliente"
			end

			if op=="5"
				puts "=>Actualizar datos proveedor"
			end

			if op=="6"
				puts "=>Desactivar cliente"
			end

			if op=="7"
				puts "=>descativar proveedor"
			end

			puts ""
		end
	end

end

####################
admin = Administrador.new("erick","admin","admin")
admin.menu