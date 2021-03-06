/*
 * The MIT License
 *
 * Copyright 2012 Universidad de Montemorelos A. C.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
package mx.edu.um.mateo.general.dao.impl;

import mx.edu.um.mateo.contabilidad.dao.EjercicioDao;
import mx.edu.um.mateo.contabilidad.model.Ejercicio;
import mx.edu.um.mateo.general.dao.BaseDao;
import mx.edu.um.mateo.general.dao.InicializaDao;
import mx.edu.um.mateo.general.dao.OrganizacionDao;
import mx.edu.um.mateo.general.dao.ReporteDao;
import mx.edu.um.mateo.general.dao.RolDao;
import mx.edu.um.mateo.general.dao.UsuarioDao;
import mx.edu.um.mateo.general.model.Empresa;
import mx.edu.um.mateo.general.model.Organizacion;
import mx.edu.um.mateo.general.model.Rol;
import mx.edu.um.mateo.general.model.Usuario;
import mx.edu.um.mateo.general.utils.Constantes;
import mx.edu.um.mateo.inventario.model.Almacen;
import mx.edu.um.mateo.inventario.model.Estatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author J. David Mendoza <jdmendoza@um.edu.mx>
 */
@Repository
@Transactional
public class InicializaDaoHibernate extends BaseDao implements InicializaDao {

    @Autowired
    private ReporteDao reporteDao;
    @Autowired
    private OrganizacionDao organizacionDao;
    @Autowired
    private EjercicioDao ejercicioDao;
    @Autowired
    private UsuarioDao usuarioDao;
    @Autowired
    private RolDao rolDao;

    @Override
    public void inicializa(String username, String password) {
        reporteDao.inicializa();
        Organizacion organizacion = new Organizacion("UM", "UM",
                "Universidad de Montemorelos");
        organizacion = organizacionDao.crea(organizacion);
        Rol rol = new Rol("ROLE_ADMIN");
        rol = rolDao.crea(rol);
        Usuario usuario = new Usuario(username, password, "Admin", "User");
        Long almacenId = 0l;
        actualizaUsuario:
        for (Empresa empresa : organizacion.getEmpresas()) {
            for (Almacen almacen : empresa.getAlmacenes()) {
                almacenId = almacen.getId();
                break actualizaUsuario;
            }
        }
        for (Ejercicio ejercicio : ejercicioDao.lista(organizacion.getId())) {
            usuario.setEjercicio(ejercicio);
            break;
        }
        usuarioDao.crea(usuario, almacenId,
                new String[]{rol.getAuthority()});
        rol = new Rol("ROLE_ORG");
        rolDao.crea(rol);
        rol = new Rol("ROLE_EMP");
        rolDao.crea(rol);
        rol = new Rol("ROLE_USER");
        rolDao.crea(rol);

        Estatus estatus = new Estatus(Constantes.ABIERTA, 100);
        currentSession().save(estatus);
        estatus = new Estatus(Constantes.PENDIENTE, 200);
        currentSession().save(estatus);
        estatus = new Estatus(Constantes.CERRADA, 300);
        currentSession().save(estatus);
        estatus = new Estatus(Constantes.FACTURADA, 400);
        currentSession().save(estatus);
        estatus = new Estatus(Constantes.CANCELADA, 500);
        currentSession().save(estatus);
    }
}
