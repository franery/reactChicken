package ar.com.escuelita.chicken.negocio.servicios.validacion.impl;

import org.springframework.beans.factory.annotation.Autowired;
import ar.com.escuelita.chicken.base.excepciones.ValidacionExcepcion;
import ar.com.escuelita.chicken.negocio.servicios.IDepositoServicio;
import ar.com.escuelita.chicken.negocio.servicios.validacion.IMovimientoValidacionServicio;
import ar.com.escuelita.chicken.presentacion.dto.DepositoDTO;

public class MovimientoValidacionServicioImpl implements IMovimientoValidacionServicio {

	@Autowired
	IDepositoServicio depositoServicio;
	
	@Override
	public void validacionStockDeposito(String depositoId, long cantidad) throws ValidacionExcepcion {
		DepositoDTO depositoDto = (DepositoDTO) depositoServicio.buscar(Long.parseLong(depositoId));
		if ((depositoDto.getStockMaximo() - depositoDto.getStockHuevos()) < cantidad) {
			throw new ValidacionExcepcion("mensajeErrorMovimientoDeposito");
		}
	}
}