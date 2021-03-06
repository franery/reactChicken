package ar.com.escuelita.chicken.test.dao;

import org.junit.runner.RunWith;
import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import ar.com.escuelita.chicken.persistencia.dao.IParametroDAO;
import ar.com.escuelita.chicken.persistencia.modelo.ParametroModel;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath*:spring-context.xml"})
public class ParametroTest {
	
	@Autowired
	IParametroDAO parametroDAO;
	
	@Test
	@Transactional(readOnly = false, propagation=Propagation.REQUIRED)
	public void test_InsertarYBuscarParametro() {
		ParametroModel p = new ParametroModel();
		p.setDescripcion("LALALApppp");
		p.setValor("ANDAAAelservicio");
		
		parametroDAO.guardar(p);
		
		ParametroModel p2 = parametroDAO.get(p.getId());
		
		Assert.assertTrue(p2.getDescripcion().equals(p.getDescripcion()));
		Assert.assertTrue(p2.getValor().equals(p.getValor()));
		Assert.assertTrue(p2.getId() == p.getId());
	}
	
	@Test
	@Transactional(readOnly = false, propagation=Propagation.REQUIRED)
	public void test_BorrarParametro() {
		ParametroModel p = new ParametroModel();
		p.setDescripcion("LALALApppp");
		p.setValor("ANDAAAelservicio");
		
		parametroDAO.guardar(p);
		parametroDAO.borrar(p.getId());
		
		ParametroModel p2 = parametroDAO.get(p.getId());
		
		Assert.assertTrue(p2.isBorrado());
	}
	
	@Test
	@Transactional(readOnly = false, propagation=Propagation.REQUIRED)
	public void test_ModificarParametro() {
		ParametroModel p = new ParametroModel();
		p.setDescripcion("LALALApppp");
		p.setValor("ANDAAAelservicio");
		
		parametroDAO.guardar(p);
		ParametroModel p2 = parametroDAO.get(p.getId());
		Assert.assertTrue(p2.getDescripcion().equals(p.getDescripcion()));
		
		
		p.setDescripcion("DescNueva");
		
		parametroDAO.modificar(p);
		
		ParametroModel p3 = parametroDAO.get(p.getId());
		
		Assert.assertTrue(!p2.getDescripcion().equals(p3.getDescripcion()));
	}
}
