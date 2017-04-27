package com.cyber.ncre.web.listener;

import java.io.File;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.apache.logging.log4j.LogManager;

import com.cyber.ncre.util.ServletUtil;

/**
 * Application Lifecycle Listener implementation class LoadDataListener
 *
 */
@WebListener
public class LoadDataListener implements ServletContextListener {


    public void contextInitialized(ServletContextEvent sce)  { 
    		File dir=new File (new File(sce.getServletContext().getRealPath("/")).getParentFile(),ServletUtil.UPLOAD_DIR_NAME);
    		if(! dir.exists()){
    			dir.mkdirs();
    		}
    		ServletUtil.UPLOAD_DIR=dir.getAbsolutePath();
    
    }

    public void contextDestroyed(ServletContextEvent arg0)  { 
         // TODO Auto-generated method stub
    }
	
}
