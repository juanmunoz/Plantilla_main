package {

	import flash.display.MovieClip;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.events.Event;
	import com.Global;
	import flash.events.MouseEvent;


	public class main extends MovieClip {

		var swf_Loader: Loader = new Loader();
		var global: Global = Global.getInstance();
		var v_paginacion: Array = new Array();
		var v_menuSkin: Array = new Array();




		public function main() {

			v_paginacion[1] = "1/2";
			v_paginacion[2] = "2/2";
			///
			v_paginacion[3] = "1/3";
			v_paginacion[4] = "2/3";
			v_paginacion[5] = "3/3";
			///
			v_paginacion[6] = "1/3";
			v_paginacion[7] = "2/3";
			v_paginacion[8] = "3/3";
			///
			v_paginacion[9] = "1/3";
			v_paginacion[10] = "2/3";
			v_paginacion[11] = "3/3";
			///
			v_paginacion[12] = "1/3";
			v_paginacion[13] = "2/3";
			v_paginacion[14] = "3/3";
			///
			v_paginacion[15] = "1/3";
			v_paginacion[16] = "2/3";
			v_paginacion[17] = "3/3";
			///
			v_paginacion[18] = "1/2";
			v_paginacion[19] = "2/2";
			///+++++++++

			v_menuSkin[1] = "Introducción";
			v_menuSkin[2] = "Introducción";
			///
			v_menuSkin[3] = "Fleteo";
			v_menuSkin[4] = "Fleteo";
			v_menuSkin[5] = "Fleteo";
			///
			v_menuSkin[6] = "Suplantación de funcionarios";
			v_menuSkin[7] = "Suplantación de funcionarios";
			v_menuSkin[8] = "Suplantación de funcionarios";
			///
			v_menuSkin[9] = "Paquete chileno";
			v_menuSkin[10] = "Paquete chileno";
			v_menuSkin[11] = "Paquete chileno";
			///
			v_menuSkin[12] = "Clonación de tarjetas";
			v_menuSkin[13] = "Clonación de tarjetas";
			v_menuSkin[14] = "Clonación de tarjetas";
			///
			v_menuSkin[15] = "Taquillazo";
			v_menuSkin[16] = "Taquillazo";
			v_menuSkin[17] = "Taquillazo";
			////
			v_menuSkin[18] = "Tips de seguridad para oficinas";
			v_menuSkin[19] = "Tips de seguridad para oficinas";


			var actualSlide: Number = 1
			var swf_archivo: String;

			mc_anterior.visible = false;
			anterior_btn.visible = false;

			cargarSlides(actualSlide, contenedor_mc)
			f_HabilitarSiguiente();

			function cargarSlides(_indice: Number, carga: UILoader) {
				////
				swf_archivo = "00" + _indice + ".swf";
				var swf_descargar: URLRequest = new URLRequest(swf_archivo);

				swf_Loader.load(swf_descargar);
				carga.addChild(swf_Loader);
				pagina_txt.text = v_paginacion[_indice];
				menu_mc.location_mc.gotoAndStop(_indice);
				nombreSkin_txt.text = v_menuSkin[_indice];

				if (_indice > 1) {
					mc_anterior.visible = true;
					anterior_btn.visible = true;
				} else {
					mc_anterior.visible = false;
					anterior_btn.visible = false;

				}

			}
			/////
			function f_HabilitarSiguiente() {

				addEventListener(Event.ENTER_FRAME, myFunction);


				function myFunction(event: Event) {
					//trace(mySO.data.habilitar);
					trace(global.getValue("bandera"));
					if (global.getValue("bandera") == true) {
						mc_siguiente.visible = true;
						siguiente_btn.visible = true;
					} else {
						mc_siguiente.visible = false;
						siguiente_btn.visible = false;
					}
				}

			}
			/////
			siguiente_btn.addEventListener(MouseEvent.CLICK, f_siguiente);
			anterior_btn.addEventListener(MouseEvent.CLICK, f_anterior);

			function f_siguiente(e: MouseEvent) {
				actualSlide = actualSlide + 1;

				cargarSlides(actualSlide, contenedor_mc);
	


			}
			
			function f_anterior(e: MouseEvent) {
				actualSlide = actualSlide - 1;

				cargarSlides(actualSlide, contenedor_mc);



			}
		}
	}

}