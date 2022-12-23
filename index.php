<!------------------------------------------------------------------------------------------>
<!--Comentario: Pese a mandar el mensaje de error los datos se guardan en la base de datos-->
<!------------------------------------------------------------------------------------------>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="utf-8">
	<title>Formulario Registro</title>
	<link rel="stylesheet" href="style.css">
	<script type="text/javascript" src="script.js"></script>
</head>
<body>
	<div class="contenedor">
		<h2>Formulario De Registro</h2>
		<form method="post" action="<?php echo $_SERVER['PHP_SELF']; ?>">
			<div class="relleno">
				<div class="col_50">
					<input class="campos" id="cliente_ID" type="text" name="cliente_ID" placeholder="Cliente..." />
				</div>
				<div class="col_50">
					<input class="campos" id="nombre" type="text" name="nombres" placeholder="Nombre..." />
				</div>
				<div class="col_50">
					<input class="campos" id="prim_apell" type="text" name="prim_apell" placeholder="Primer Apellido..." />
				</div>
				<div class="col_50">
					<input class="campos" id="seg_apell" type="text" name="seg_apell" placeholder="Segundo Apellido..." />
				</div>
				<div class="col_50">
					<input class="campos" id="genero" type="text" name="genero" placeholder="Total vuelos..." />
				</div>
        <div class="col_50">
					<input class="campos" id="distrito" type="text" name="distrito" placeholder="Horas vuelos..." />
				</div>
        <div class="col_50">
					<input class="campos" id="correo" type="text" name="correo" placeholder="Horas vuelos..." />
				</div>
        <div class="col_50">
					<input class="campos" id="contrasenia" type="text" name="contrasenia" placeholder="Horas vuelos..." />
				</div>
				<button id="btnAgregar" class="btn" type="submit">Agregar</button>
			</div>
		</form>
	</div>
	<h2 style="text-align: center;">Clientes Registrados</h2>
	<table id="tablaUsuarios" class="tabla">
		<thead>
			<tr>
				<th>Cliente</th>
				<th>Nombre</th>
				<th>Primer Apellido</th>
        <th>Segundo Apellido</th>
        <th>Género</th>
        <th>Distrito</th>
				<th>E-mail</th>
				<th>Contraseña</th>
			</tr>
		</thead>
		<tbody>
			<?php
			$BaseDatos = new base_datos("localhost","root","","tienda_bicicleta");
			$BaseDatos->conectar();

			if ($_SERVER["REQUEST_METHOD"] == "POST") {
				$cliente = $_POST["cliente_ID"];
				$nom = $_POST["nombre"];
				$pp = $_POST["prim_apell"];
				$sp = $_POST["seg_apell"];
				$gen = $_POST["genero"];
        $ubi = $_POST["distrito"];
        $email = $_POST["correo"];
        $passw = $_POST["contrasenia"];

				$BaseDatos->insCliente($cliente, $nom, $pp, $sp, $gen, $ubi, $email, $passw);
			}

			$clientes = $BaseDatos->getClientes();
			if (!is_null($cliente)) {
				while ($row = mysqli_fetch_assoc($cliente)) {
					echo "<tr>";
					echo "<td>" . $row["cliente_ID"] . "</td>";
					echo "<td>" . $row["nombre"] . "</td>";
					echo "<td>" . $row["prim_apell"] . "</td>";
					echo "<td>" . $row["seg_apell"] . "</td>";
					echo "<td>" . $row["genero"] . "</td>";
          echo "<td>" . $row["distrito"] . "<\td>";
          echo "<td>" . $row["correo"] . "<\td>";
          echo "<td>" . $row["contrasenia"] . "<\td>";
					echo "</tr>";
				}
			}
			$BaseDatos->cerrar();
			?>
		</tbody>
	</table>
</body>
</html>
	
<?php

class base_datos {

	function __construct($host, $usua, $pass, $bd) {
		$this->host = $host;
		$this->usua = $usua;
		$this->pass = $pass;
		$this->bd = $bd;
	}

	function conectar()	{
		$this->conexion = mysqli_connect($this->host,$this->usua,$this->pass,$this->bd);
		$this->conexion->set_charset("utf8");

		if (mysqli_connect_errno()) {
			echo "Error al conectarse";
		}
	}

	function getClientes()
	{
		$result = mysqli_query($this->conexion,"SELECT * FROM piloto");
		$error = mysqli_error($this->conexion);

		if (empty($error)) {
			if (mysqli_num_rows($result) > 0) {
				return $result;
			}
		}
		else {
			echo "error al obtener pilotos";
		}
		return null;
	}

	function insCliente($cliente, $nom, $pp, $sp, $gen, $ubi, $email, $passw)
	{
		$insertarDatos = "INSERT INTO clientes VALUES ('$cliente','$nom','$pp','$sp','$gen','$ubi, $email, $passw')";
		//mysqli_query($this->conexion, "INSERT INTO clientes VALUES (" . $dni . ", '" . $nom ."', '" . $ape . "')");
		mysqli_query($this->conexion,$insertarDatos);
		$error = mysqli_error($this->conexion);
		if (empty($error)) {
			return true;
		}
		echo "Error al intentar agregar piloto";
		return false;
	}

	function cerrar() {
		mysqli_close($this->conexion);
	}
}
?>