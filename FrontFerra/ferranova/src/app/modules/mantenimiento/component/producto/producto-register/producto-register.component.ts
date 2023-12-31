import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { AccionMantConst } from '@constants/general.constants';
import { alert_error, alert_success } from '@functions/general.functions';
import { VProductoResponse } from '@models/vproducto-response.model';
import { VProductoRequest } from '@modules/auth/models/vproducto-request.model';
import { ProductoService } from '@modules/mantenimiento/service/producto.service';

@Component({
  selector: 'app-producto-register',
  templateUrl: './producto-register.component.html',
  styleUrls: ['./producto-register.component.scss']
})
export class ProductoRegisterComponent implements OnInit{
  
  /**TODO: Declarando Variables de entrada */
  @Input() title     : string = "";
  @Input() producto  : VProductoResponse = new VProductoResponse();
  @Input() accion    : number = 0;


/**TODO: Declarando Variables de salida */
  @Output() closeModalEmmit = new EventEmitter<boolean>();

    /**TODO: Declarando Variables internas */
  myForm          : FormGroup;
  productoEnvio   : VProductoRequest = new VProductoRequest();
  constructor(
    private fb: FormBuilder,
    private _productoService: ProductoService,

  )
  {
    this.myForm = this.fb.group({
      IdProducto :[{value : 0, disabled: true },[Validators.required]],
      Nombre     :['',[Validators.required]],
      Descripcion:['',[Validators.required]],
      Stock      :['',[Validators.required]],
      Precio     :['',[Validators.required]],
      IdEstado   :['',[Validators.required]],
});
  }

  
  ngOnInit(): void {

    console.log("title ==>", this.title);
    console.log("producto ==>", this.producto);
 
    this.myForm.patchValue(this.producto);
    
  }
  guardar()
  {
    this.productoEnvio = this.myForm.getRawValue()
    switch(this.accion)
    {
      case AccionMantConst.crear:
        this.crearRegistro();
          break;
      case AccionMantConst.editar:
        this.editarRegistro();
          break;
      case AccionMantConst.eliminar: 
          break;
    }
  }
  crearRegistro(){
    this._productoService.create(this.productoEnvio).subscribe({
      next:(data: VProductoResponse)=>{
        alert_success("Creado existosamente","CREADO");
      },
      error:()=>{
        alert_error("Ocurrio un error","ERROR");
      },
      complete:()=>{
        this.cerrarModal(true);
      }
    })
  }
  editarRegistro(){
    this._productoService.update(this.productoEnvio).subscribe({
      next:(data:VProductoResponse)=>{
        alert_success("actualizado de forma correcta","ACTULIZADO");
      },
      error:()=>{
        alert_error("Ocurrio un error","ERROR");
      },
      complete:()=>{
        this.cerrarModal(true);
      }
    });

  }
  cerrarModal(res: boolean)
  {
    //true ==> hubo modificacion en base de datos ==> necesito volver a cargar la lista
    //false ==> no hubo modificacion en base de datos ==> no necesito volver a cargar la lista
    this.closeModalEmmit.emit(res);
  }
  
}