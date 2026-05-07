from django.db import models

class Cliente(models.Model):
    nombre = models.CharField(max_length=50, null=True, blank=True)
    apellido = models.CharField(max_length=50, null=True, blank=True)
    dni = models.CharField(max_length=50, null=True, blank=True)
    email = models.EmailField(max_length=50, null=True, blank=True)
    telefono = models.CharField(max_length=20, null=True, blank=True)

    class Meta:
        db_table = 'cliente'

    def __str__(self):
        return f'{self.nombre} {self.apellido}'

class Vendedor(models.Model):
    nombre = models.CharField(max_length=50, null=True, blank=True)
    apellido = models.CharField(max_length=50, null=True, blank=True)
    telefono = models.CharField(max_length=20, null=True, blank=True)
    direccion = models.CharField(max_length=50, null=True, blank=True)
    correo = models.CharField(max_length=100, null=True, blank=True)

    class Meta:
        db_table = 'vendedor'

    def __str__(self):
        return f'{self.nombre} {self.apellido}'

class Producto(models.Model):
    nombre = models.CharField(max_length=50, null=True, blank=True)
    descripcion = models.TextField(null=True, blank=True)
    precio = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    stock = models.IntegerField(null=True, blank=True)

    class Meta:
        db_table = 'producto'

    def __str__(self):
        return self.nombre

class Pedido(models.Model):
    id_vendedor = models.ForeignKey(Vendedor, on_delete=models.SET_NULL, null=True, blank=True, db_column='id_vendedor')
    id_cliente = models.ForeignKey(Cliente, on_delete=models.SET_NULL, null=True, blank=True, db_column='id_cliente')
    fecha = models.DateTimeField(null=True, blank=True)
    estado = models.CharField(max_length=20, null=True, blank=True)
    total = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)

    class Meta:
        db_table = 'pedido'

    def __str__(self):
        return f'Pedido {self.id}'

class DetallePedido(models.Model):
    id_pedido = models.ForeignKey(Pedido, on_delete=models.SET_NULL, null=True, blank=True, db_column='id_pedido')
    id_producto = models.ForeignKey(Producto, on_delete=models.SET_NULL, null=True, blank=True, db_column='id_producto')
    cantidad = models.IntegerField(null=True, blank=True)
    subtotal = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)

    class Meta:
        db_table = 'detalle_pedido'

class Pago(models.Model):
    id_pedido = models.ForeignKey(Pedido, on_delete=models.SET_NULL, null=True, blank=True, db_column='id_pedido')
    metodo = models.CharField(max_length=50, null=True, blank=True)
    monto = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    fecha = models.DateTimeField(default=None, null=True, blank=True)

    class Meta:
        db_table = 'pago'