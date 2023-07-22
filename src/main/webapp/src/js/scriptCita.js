/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function reporte(accion){
    $.get('ServletCitas?menu=exportarReporteCitas', function (r){
        if(r){
            $('#accion').val(accion);
            $('#lista').val(JSON.stringify(r));
            $('#frmReporte').submit();
        }else{
            alert('El reporte no se pudo generar debido a un error : ' + r);
        }
    });
} 

