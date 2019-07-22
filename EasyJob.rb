#clase servicio
class Servicio
	def initialize(nombre,tarifa)
		@nombre = nombre
		@tarifa = tarifa
		@estado = true
	end

	def to_s
		"#{@nombre} #{@tarifa} #{@estado}"
	end

	#Metodos

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
	def initialize(nombre,usuario,contrasenia,aceptado)
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
	servicios = []
	propuestas = []

	def initialize(nombre,usuario,contrasenia)
		super(nombre,usuario,contrasenia)
	end

	def to_s
		"#{@nombre} #{@usuario} #{@contrasenia} #{@servicios}"
	end

	#Metodos

	def agregar_servicio
		puts "Agrego un servicio"
	end

	def configurar_tarifa
		puts "Configurando la tarifa"
	end

	def aceptar_propuesta
		puts "Acpetando la propuesta"
	end

	def desactivar_cuenta
		puts "Desactivando la cuenta"
	end
end

#Clase administrador
class Administrador < Usuario
	clientes = []
	proveedores = []

	def initialize(nombre,usuario,contrasenia)
		super(nombre,usuario,contrasenia)
	end

	#Metodos
	def crear_usuario()
		puts "Creando usuario"
	end

	def actualizar_datos_usuario()
		puts "Actualizando datos de un usuario especifico"
	end

	def desactivar_usuario()
		puts "Estoy desactivando el usuario"
	end

	def generar_reportes()
		puts "Estoy generando reportes"
	end

	def crear_servicio()
		puts "creando un servicio"
	end
end

mi_proveedor = Proveedor.new("AXE","usuario_axe","contrasenia_axe")
puts mi_proveedor.to_s