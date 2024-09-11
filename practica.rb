require 'securerandom'
# es un módulo en Ruby que proporciona métodos para generar números y cadenas aleatorias de manera criptográficamente segura.
# Es parte de la biblioteca estándar de Ruby y se usa comúnmente para generar valores aleatorios que necesitan ser impredecibles, como tokens, claves de API, contraseñas, etc.

# Clase Persona
class Persona
  # Sobre attr_accessor: es una manera rápida de crear métodos de acceso para los atributos de una clase.
  # Permite que los atributos de la clase se puedan leer y escribir desde fuera de la clase.

  # Esto ahorra código y tiempo, por ejemplo:
  # attr_accessor :nombre es equivalente a escribir estos dos métodos:

  # def nombre
    # @nombre
  # end

  # def nombre=(nuevo_nombre)
   # @nombre = nuevo_nombre
  #end

  attr_accessor :nombre, :apellido, :domicilio, :dni, :mascota

  def initialize(nombre, apellido, domicilio, dni)
    @nombre = nombre
    @apellido = apellido
    @domicilio = domicilio
    @dni = dni
  end

  def to_s
    "Nombre: #{@nombre} #{@apellido}, Domicilio: #{@domicilio}, DNI: #{@dni}, Mascota: #{@mascota.nombre}"
  end
end

# Clase Mascota, tambien usamos attr_accessor para esta clase
class Mascota
  attr_accessor :nombre

  def initialize(nombre)
    @nombre = nombre
  end
end

# Arreglo de hashes con la información de personas
personas_data = [
  {nombre: "Juan", apellido: "Pérez", domicilio: "Buenos Aires 75", dni: "35412305"},
  {nombre: "Abi", apellido: "García", domicilio: "Av. Rosario 45 bis", dni: "35256890"},
  {nombre: "Manuel", apellido: "López", domicilio: "Rosario 3000", dni: "35698742"},
  {nombre: "Emer", apellido: "Matijasevic", domicilio: "Av. Corrientes 14", dni: "35412368"},
  {nombre: "Julian", apellido: "Sandoval", domicilio: "Rosario 2024", dni: "35634589"},
  {nombre: "Ale", apellido: "Fernández", domicilio: "Cordoba 2024", dni: "35698745"},
  {nombre: "Noelia", apellido: "Ruiz", domicilio: "Rosario 2000", dni: "35639868"}
]

# Lista predefinida de nombres de mascotas, se incluyen al menos cinco como pide el ejercicio
nombres_mascotas = ["Facu", "Ron", "Luna", "Bonita", "Nino"]

# Transformar arreglo de hashes en arreglo de objetos 'Persona'
personas = personas_data.map do |data|
  Persona.new(data[:nombre], data[:apellido], data[:domicilio], data[:dni])
end

# Asignar una mascota aleatoria a cada persona
personas.each do |persona| # para cada objeto instancia de la clase Persona se asigna una mascota de forma aleatoria
  nombre_mascota = nombres_mascotas.sample # sample es un método integrado que se usa para obtener un elemento aleatorio de un arreglo.
  # En este caso nombres_mascotas.sample está obteniendo un nombre aleatorio de la lista nombres_mascotas.
  persona.mascota = Mascota.new(nombre_mascota)
end

# Guardamos la información en el archivo .txt
begin
  File.open("personas.txt", "w") do |file| #usamos w para escribir en el archivo
    personas.each do |persona|
      file.puts persona.to_s
    end
  end
  puts "Datos guardados exitosamente en el archivo personas.txt"
rescue => e
  # MANEJO DE ERRORES AL GUARDAR LOS DATOS
  # gestionar cualquier posible error que pueda surgir durante el proceso de escritura en el archivo.
  puts "Ocurrió un error al guardar los datos en el archivo: #{e.message}"
end
