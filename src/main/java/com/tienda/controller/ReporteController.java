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

    @GetMapping("/ventasp")
    public ResponseEntity<Resource> ventas(@RequestParam String tipo) throws IOException {
        return reporteService.generateReporte(
                "ventasp",
                null,
                tipo);
    }

    @GetMapping("/productosp")
    public ResponseEntity<Resource> productosp(@RequestParam String tipo) throws IOException {
        return reporteService.generateReporte(
                "productosp",
                null,
                tipo);
    }

    @GetMapping("/facturasp")
    public ResponseEntity<Resource> facturasp(@RequestParam String tipo) throws IOException {
        return reporteService.generateReporte(
                "facturasp",
                null,
                tipo);
    }
}
