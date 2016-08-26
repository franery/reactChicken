package ar.com.escuelita.chicken.negocio.mapeos;

import ar.com.escuelita.chicken.base.dto.DTO;
import ar.com.escuelita.chicken.base.mapeador.Mapeador;
import ar.com.escuelita.chicken.persistencia.modelo.DepositoModel;
import ar.com.escuelita.chicken.persistencia.modelo.GallineroModel;
import ar.com.escuelita.chicken.persistencia.modelo.Modelo;
import ar.com.escuelita.chicken.persistencia.modelo.MovimientoModel;
import ar.com.escuelita.chicken.presentacion.dto.DepositoDTO;
import ar.com.escuelita.chicken.presentacion.dto.GallineroDTO;
import ar.com.escuelita.chicken.presentacion.dto.MovimientoDTO;

public class MovimientoMapeador extends Mapeador {

	private DepositoMapeador depositoMapeador = new DepositoMapeador();
	private GallineroMapeador gallineroMapeador = new GallineroMapeador();
	
	@Override
	public DTO map(Modelo vo) {
		MovimientoModel model = (MovimientoModel) vo;
		MovimientoDTO dto = new MovimientoDTO();
		
		dto.setId(model.getId());
		dto.setCantidad(model.getCantidad());
		dto.setDeposito((DepositoDTO)depositoMapeador.map(model.getDeposito()));
		dto.setFecha(model.getFecha());
		dto.setGallinero((GallineroDTO)gallineroMapeador.map(model.getGallinero()));
		
		return dto;
	}

	@Override
	public Modelo map(DTO dto, Modelo vo) {
		MovimientoDTO movimientoDTO = (MovimientoDTO) dto;
		MovimientoModel movimientoModel = (MovimientoModel) (vo != null ? vo : new MovimientoModel());

		movimientoModel.setCantidad(movimientoDTO.getCantidad());
		movimientoModel.setDeposito((DepositoModel)depositoMapeador.map(movimientoDTO.getDeposito(),movimientoModel.getDeposito()));
		movimientoModel.setFecha(movimientoDTO.getFecha());
		movimientoModel.setGallinero((GallineroModel)gallineroMapeador.map(movimientoDTO.getGallinero(),movimientoModel.getGallinero()));
		
		return movimientoModel;
	}
}