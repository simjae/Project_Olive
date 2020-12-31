package com.olive.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("etc")
public class AlertsController {
	
	@RequestMapping("Alerts.do")
	public String showAllAlerts() {
		
		return "etc/Alerts";
		
	}
	
}
