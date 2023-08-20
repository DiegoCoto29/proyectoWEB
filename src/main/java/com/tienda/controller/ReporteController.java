package com.tienda.controller;

import com.tienda.service.ReporteService;
import java.io.IOException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/reportes")
public class ReporteController {

    @Autowired
    ReporteService reporteService;

    @GetMapping("/principal")
    public String principal(Model model) {
        return "/reportes/principal";
    }

    @GetMapping("/ventas1")
    public ResponseEntity<Resource> ventas1(@RequestParam String tipo) throws IOException {
        return reporteService.generateReporte(
                "ventas1",
                null,
                tipo);
    }

    @GetMapping("/productos1")
    public ResponseEntity<Resource> productos1(@RequestParam String tipo) throws IOException {
        return reporteService.generateReporte(
                "productos1",
                null,
                tipo);
    }

    @GetMapping("/facturas1")
    public ResponseEntity<Resource> facturas1(@RequestParam String tipo) throws IOException {
        return reporteService.generateReporte(
                "facturas1",
                null,
                tipo);
    }
}
