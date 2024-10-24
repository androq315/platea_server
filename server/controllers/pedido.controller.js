import { fileURLToPath } from 'url';
import path, { dirname } from 'path';
import { sequelize } from '../config/db.js';
import { Pedido } from '../models/pedido.model.js';
import nodemailer from 'nodemailer';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

class PedidoController {
  static async Compra(req, res) {
    try {
      const hola = await sequelize.transaction(async (t) => {
        const p = {
          IdPersonaFK: req.body.IdPersonaFK,
          Direccion: req.body.Direccion,
          Ciudad: req.body.Ciudad
        }

        const pedidoId = await Pedido.createPedido(p)
        const precioTotal = await Pedido.createPedidoProducto(pedidoId, req.body.IdPersonaFK)
        return pedidoId
      });

      res.status(200).json({ idPedido: hola });
    } catch (error) {
      console.error("Error al crear el pedido:", error);
      res.status(500).json({ error: 'Error al realizar la compra' });
    }
  }
  static async GetProductosPedido(req, res) {
    try {
      const id = req.params.id;
      const pedido = await Pedido.GetProductosPedido(id);
      res.status(200).json(pedido);
    } catch (error) {
      res.status(500).json({ message: 'Error al obtener tiendas de electrodomésticos: ' + error });
    }
  }

  static async GetPedidoPersona(req, res) {
    try {
      const id = req.params.id;
      const pedido = await Pedido.GetPedidosPersona(id);
      res.status(200).json(pedido);
    } catch (error) {
      res.status(500).json({ message: 'Error al obtener tiendas de electrodomésticos: ' + error });
    }
  }

  static async ConfirmarCompra(req, res) {
    try {
        // Validar y obtener el total
        const total = parseFloat(req.body.Total);
        if (isNaN(total)) {
            return res.status(400).json({ error: 'El total debe ser un número válido.' });
        }

        // Actualizar el precio del pedido
        await Pedido.actualizarPrecio(total, req.body.IdPedido);

        // Obtener detalles del pedido
        const pedidoDetalles = await Pedido.GetProductosPedido(req.body.IdPedido);
        console.log('Detalles del pedido:', pedidoDetalles);

        if (!pedidoDetalles || pedidoDetalles.length === 0) {
            throw new Error('No se encontraron detalles del pedido.');
        }

        // Crear un objeto para agrupar productos por vendedor
        const productosPorVendedor = {};

        pedidoDetalles.forEach(producto => {
            const idVendedor = producto.IdArrendatario; // Asumiendo que IdArrendatario es el identificador del vendedor

            if (!productosPorVendedor[idVendedor]) {
                productosPorVendedor[idVendedor] = {
                    email: producto.correoPersona, // Correo del vendedor
                    productos: []
                    
                };
                console.log("tastas: ",productosPorVendedor)
            }

            productosPorVendedor[idVendedor].productos.push(producto);
        });

        // Actualizar el stock de los productos y enviar correos
        for (const [idVendedor, data] of Object.entries(productosPorVendedor)) {
            const { email, productos } = data;
            console.log("tastas: ", email)
            // Actualizar el stock de los productos de este vendedor
            for (const producto of productos) {
                const totalStock = producto.StockProducto - producto.cantidad;
                await Pedido.StockProductoPedido(producto.IdProducto, totalStock);
            }
            console.log("tas: ", email)
            // Enviar correo de confirmación con solo los productos del vendedor
            await PedidoController.enviarCorreo(email, productos, total);
        }

        // Vaciar el carrito del usuario
        await Pedido.VaciarCarrito(req.body.IdPersona);

        res.status(200).json({ message: 'Compra creada correctamente y correos enviados a los vendedores.' });
    } catch (error) {
        console.error("Error al crear el pedido:", error);
        res.status(500).json({ error: error.message || 'Error al realizar la compra' });
    }
}


  static async enviarCorreo(correo, productos, total) {

    try {
      console.log(correo)
      // Verifica que el correo no esté vacío
      if (!correo || typeof correo !== 'string' || !correo.includes('@')) {
        throw new Error('La dirección de correo es inválida.');
        
      }

      console.log('Enviando correo a:', correo); // Para depuración

      const transporter = nodemailer.createTransport({
        service: 'gmail',
        auth: {
          user: 'platteaonline@gmail.com',
          pass: 'wnvy erst cony surb' // Cambia esto por una variable de entorno
        }
      });

      const formatPrice = (precio) => {
        // Convertir el precio a número y formatearlo con puntos de miles
        const numero = Number(precio);
        return new Intl.NumberFormat('es-ES').format(numero);
      };

      const productosDetalles = productos.map(producto => `
          <li><Strong>Nombre del producto: </Strong>${producto.NombreProducto} -  <Strong>Cantidad:</Strong> ${producto.cantidad} -<Strong> Stock:</Strong> ${producto.StockProducto} </li>
      `).join('');

      const mailOptions = {
        from:'"PLATTEA" <platteaonline@gmail.com>',
        to: correo,
        subject: '¡Has realizado una venta! 🎉',
        html: `
             <h1>¡Venta Confirmada!</h1>
             <p>Felicitaciones, has vendido los siguientes productos:</p>
             <ul>${productosDetalles}</ul>
             <p>Asegúrate de preparar el pedido lo antes posible para garantizar una excelente experiencia al cliente.</p>
             <p>Gracias por usar Platea, sigue vendiendo con nosotros.</p>
             <br>
             <p>Atentamente,</p>
             <p>El equipo de Platea</p>
          `
      };

      await transporter.sendMail(mailOptions);
      console.log('Correo enviado exitosamente');
    } catch (error) {
      console.error("Error al enviar el correo:", error);
      throw error; // Re-lanzar el error para manejarlo en ConfirmarCompra
    }
  }


}


export default PedidoController;
