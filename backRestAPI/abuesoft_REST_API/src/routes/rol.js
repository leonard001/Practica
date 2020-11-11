const { Router } = require('express');
const express = require('express');
const router = express.Router();

const mysqlConnection = require('../database');

router.get('/abuesoft/rol', (req, res) => {
    mysqlConnection.query('SELECT * FROM abuesoft.rol', (err, rows, fields) => {
        if(!err){
            res.json(rows);
        } else {
            console.log(err);
        }
    });
});

router.get('/abuesoft/rol/:id', (req, res) => {
    const { id } = req.params;
    mysqlConnection.query('SELECT * FROM abuesoft.rol WHERE idrol = ?', [id], (err, rows, fields) => {
        if(!err){
            res.json(rows[0]);
        } else {
            console.log(err);
        }
    });
});

router.post('/abuesoft/rol', (req, res) => {
    const { id, nombre, descripcion } = req.body;
    const query = `
        CALL abuesoft.AddEditRol(?, ?, ?);
    `;
    mysqlConnection.query(query, [id, nombre, descripcion], (err, rows, fields) => {
        if(!err){
            res.json({status: 'Rol saved'});
        } else {
            console.log(err);
        }
    });
});

router.put('/abuesoft/rol/:id', (req, res) => {
    const { nombre, descripcion } = req.body;
    const { id } = req.params;
    const query = `CALL abuesoft.AddEditRol(?, ?, ?)`;
    mysqlConnection.query(query, [id, nombre, descripcion], (err, rows, fields) => {
        if(!err){
            res.json({status: 'Rol updated'});
        } else {
            console.log(err);
        }
    });
});

router.delete('/abuesoft/rol/:id', (req, res) => {
    const { id } = req.params;
    mysqlConnection.query('DELETE FROM abuesoft.rol WHERE idrol = ?', [id], (err, rows, fields) => {
        if(!err){
            res.json({status: "Rol deleted"});
        } else {
            console.log(err);
        }
    });
});

module.exports = router;